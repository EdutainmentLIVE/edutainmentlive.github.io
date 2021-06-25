# Improving performance 20-fold with a junior Haskeller

by @codygman (Senior Engineer @ ITProTV)

## Problem: Running the scripts for one day took 7 minutes

### My first encounter: A microsoft teams thread

After finishing up a clubhouse ticket, I saw this chat thread started by Vismaya:

> Sara and I were running course-info script for a day and noticed it takes a lot of time to finish as it gets all completion and progress related to all courses for the dates it is being run and its supposed to run quarterly. Should we make this a job to run during off hours?

This immediately grabbed my attention since we don't get a chance to do performance optimization very often because naive Haskell the clearest solution and plenty fast enough. At first I agreed with the no-code solution of just making this a job that runs off hours, but I'm glad we investigated in the end since it hit our database a little harder than we would have liked.

### Our infrastructure constraints and complexities

We have part of our data in our mongo database and part in a postgresql database. The tables relevant to that problem are:

- completions (Postgres)
- progress (Postgres)
- courses (Mongo)

Aside: In a retrospective some time ago, we decided to begin migrating to postgresql since a lot of our business cases could be executed more easily with full SQL queries and other important soft-concerns such as familiarity and likeability. 

## Identifying an n*m query in Haskell code

### A glance at the simplified code

```
run :: IO ()
run = do
  -- ... snip ...
  Urza.runUrzaT environment $ do
    courses <- findModels Models.allVisibleCoursesQuery
    courseTags <- findModels . Models.courseTagsByCourseIdsQuery $ fmap Course.id courses
    tags <- findModels . Models.tagsByTagIdsQuery $ fmap Join.CourseTag.tagId courseTags
    let
      courseTagsByCourseId = groupBy Join.CourseTag.courseId courseTags
      tagById = indexBy Tag.id tags
    outputs <- liftMetricsOrville
      $ mapM (getCourseInfo courseTagsByCourseId tagById startDate endDate) courses
    writeCsvFile outputFile outputs

getCourseInfo
  :: (MonadMongo m, MonadPostgres m)
  => Map Course.Id [Join.CourseTag.CourseTag]
  -> Map Tag.Id Tag.Tag
  -> Maybe UTCTime
  -> Maybe UTCTime
  -> Course.Course
  -> m Output
getCourseInfo courseTags tags startDate endDate course = do
  episodes <- Query.getEpisodesByCourseId $ Course.id course
  let episodeExternalIds = fmap Episode.episodeExternalId episodes
  progresses <- getProgresses episodeExternalIds startDate endDate
  completions <- getCompletions episodeExternalIds startDate endDate
  pure $ Output
    { outputCourseId = Course.id course
    -- ... snip ...
    , outputCourseStarts = length $ filter
      ((> 0) . completionPercentToDouble . episodeProgressEventPercent)
      progresses
    , outputCourseCompletions = length completions
    }
```

### Quickly identifying the problem: The Haskell advantage

This is the part where experience pays off and lets you skip carefully reading the entire block of code, and instead scan for keywords such as `mapM`.

In fact, Haskell gives us a meaningful advantage here over imperative languages that prefer `for` or `while` over structured looping constructs such as `map` or `filter`. The distinction between pure and effectful functions with `IO` build upon this advantage, letting me know that the slow down is likely to come from `mapM` or 
`filterM` so I can freely skim past keywords of pure looping constructs like `map`, `fmap`, and `filter`.

It's a common misconception that separating pure and effectful code has no real world benefit. I see this misconception shared by both newcomers to Haskell and otherwise experienced programmers without real world haskell experience. Hopefully this small example combined with a good faith attempt to see just how powerful this technique would be debugging at scale can help set the record straight.

### Avoid using `mapM_ someFunctionWithAQuery` 

But how do you get the information? One way to do it is by querying for all of your information up front and creating a lookup map. Or if you're lucky and have all of your data in a relational database, this would be a simple join. Alas, you will eventually find yourself in situations like this where you need to know solutions to work with the infrastructure you currently have rather than the infrastructure you wish you had.

Haskell also makes getting to the infrastructure you wish you had easier, but we'll save that topic for a future blogpost.

Here's the diff from the higher level function that used `mapM`:

```diff
+    episodes :: [Episode.Episode] <- Query.getEpisodesByCourseIdsOrEpisodeIds
+      (fmap Course.id courses)
+      []
     courseTags <- Gluon.findModels . Models.courseTagsByCourseIdsQuery $ fmap Course.id courses
     tags <- Gluon.findModels . Models.tagsByTagIdsQuery $ fmap Join.CourseTag.tagId courseTags
     let
       courseTagsByCourseId = Gluon.groupBy Join.CourseTag.courseId courseTags
       tagById = Gluon.indexBy Tag.id tags
-    outputs <- Gluon.liftMetricsOrville
-      $ mapM (getCourseInfo courseTagsByCourseId tagById startDate endDate) courses
+      courseIdToEpisode :: Map Course.Id [Episode.Episode] =
+        Gluon.groupBy Episode.episodeCourse episodes
+      episodeExternalIds = fmap Episode.episodeExternalId episodes
+    progress <- Gluon.liftMetricsOrville $ getProgresses episodeExternalIds startDate endDate
+    completions <- Gluon.liftMetricsOrville $ getCompletions episodeExternalIds startDate endDate
+    let
+      episodeToProgressMap = Gluon.groupBy Gluon.episodeProgressEventEpisodeExternalId progress
+      episodeToCompletionMap =
+        Gluon.groupBy Gluon.episodeCompletionFactEpisodeExternalId completions
+      outputs = fmap
+        (getCourseInfo
+          episodeToProgressMap
+          episodeToCompletionMap
+          courseIdToEpisode
+          courseTagsByCourseId
+          tagById
+        )
+        courses
     Gluon.writeCsvFile outputFile outputs
```

And here's the diff for the `getCourseInfo` function that was being mapped over. Note that it's now pure and takes quite a few lookup maps.

```diff
 getCourseInfo
-  :: (Gluon.MonadMongo m, Gluon.MonadPostgres m)
-  => Map Course.Id [Join.CourseTag.CourseTag]
+  :: Map Episode.ExternalId [Gluon.SavedEpisodeProgressEvent]
+  -> Map Episode.ExternalId [Gluon.SavedEpisodeCompletionFact]
+  -> Map Course.Id [Episode.Episode]
+  -> Map Course.Id [Join.CourseTag.CourseTag]
   -> Map Tag.Id Tag.Tag
-  -> Maybe UTCTime
-  -> Maybe UTCTime
   -> Course.Course
-  -> m Output
-getCourseInfo courseTags tags startDate endDate course = do
-  episodes <- Query.getEpisodesByCourseId $ Course.id course
-  let episodeExternalIds = fmap Episode.episodeExternalId episodes
-  progresses <- getProgresses episodeExternalIds startDate endDate
-  completions <- getCompletions episodeExternalIds startDate endDate
-  pure $ Output
-    { outputCourseId = Course.id course
... snip ...
-    , outputTagNames =
-      fmap Tag.name . mapMaybe (flip Map.lookup tags . Join.CourseTag.tagId) $ Map.findWithDefault
-        []
-        (Course.id course)
-        courseTags
... snip ...
-    }
+  -> Output
+getCourseInfo episodeToProgressMap episodeToCompletionMap courseIdToEpisode courseTags tags course
+  = do
+    let
+      episodes = Map.findWithDefault [] (Course.id course) courseIdToEpisode
+      episodeExternalIds = fmap Episode.episodeExternalId episodes
+      progresses = concat . Map.elems $ Map.filterWithKey
+        (\k _ -> elem k episodeExternalIds)
+        episodeToProgressMap
+      completions =
+        Map.elems $ Map.filterWithKey (\k _ -> elem k episodeExternalIds) episodeToCompletionMap
+    Output
+      { outputCourseId = Course.id course
... snip ...
+      , outputTagNames =
+        fmap Tag.name . mapMaybe (flip Map.lookup tags . Join.CourseTag.tagId) $ Map.findWithDefault
+          []
+          (Course.id course)
+          courseTags
... snip ...
+      }
```

## Pausing to reflect on learning and mentoring opportunities

The job of a senior engineer isn't done just because the problem is solved. If time permits, it's wise to reflect on lessons learned and if possible explain the trade off of technical decisions and how they tie into delivering business value and reliable systems.

A few things come to mind here for me:

- Encountering more cases in code like this could mean migrating other models into postgres from mongo should be prioritized.
- This is a good real world example to start a team discussion on how to recognize when the `M` in `N*M` is too large.
- If this is a common scenario, should it be added to an onboarding document for new hires?

A few other things were taught that are worth mentioning in brief:

- The importance of measuring performance with your language runtime (ex. `program.exe +RTS -s` rather than unix `time program.exe`)
- What would you have done if fixing the `N*M` query wasn't enough? (eg. profile: `program.exe +RTS -p`)
- Demonstrating how trivial the problem would be if all data models were in postgres

## That's all!

And that's it! Hopefully seeing a typical problem being solved in Haskell and the techniques used by a senior engineer to leverage the strength of the language will be useful to others.
