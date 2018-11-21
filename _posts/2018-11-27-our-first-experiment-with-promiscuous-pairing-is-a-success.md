# Our First Experiment with Promiscuous Pairing Is a Success

By Jason Fry (@JasonMFry)

Inspired by @arlobelshee's [Promiscuous Pairing paper][], we embarked on our own experiment on
2018-10-16. It was a big success :smile:. This is our experience.

## Background

Our team is small: 5 software engineers and 1 lead engineer who pairs roughly half of the time. Our
professional software engineering experience is as follows: 6 months, 2 years, 3 years, 4 years, 8
years, and 13 years.

Before this experiment, roughly 80% of code was written by a pair (see [previous post on
pairing][]). We described ourselves as familiar with pairing, but needing improvement. Pairs owned a
story (task) and would pair until the story was complete. In practice pairs would stay together for
several days--sometimes a week or more--because we waited until 2 pairs had each completed stories,
and that timing didn't line up very often. We had a mix of pull-based and push-based stories,
meaning that we usually chose our own stories but occasionally we were assigned stories by someone
(usually the lead engineer).

## Implementation

We have 1-week sprints from Tuesday to Tuesday. We decided our experiments would be for 4 sprints.
We used 2 1.5-hour blocks in the morning and 2 2-hour blocks in the afternoon. For any given block,
one person was the Jedi (they were on the story during the previous block) and the other was the
padawn. When rotating pairs, we tried to put the person with the least knowledge of the story on
that story as the next padawn. The padawn drove on their own machine (with few exceptions) while the
Jedi navigated.

While our team has an even number, the lead engineer wasn't always pairing so we were often left
with a Han Solo who did solo work. That solo work usually included things like reviewing PRs,
writing blag posts, reading/researching, or very simple stories.

Stories were still a mix of pull-based and push-based.

## Benefits

The data below is for our first experience with promiscuous pairing, from 2018-10-16 to 2018-11-13.

Note that the experiment here was just trying to figure out promiscuous pairing. We went into this
experiment expecting it to take some time before it paid off, if it paid off at all. Boy were we
wrong...in a good way :smile:

### Data

<!-- add before and after data from clubhouse -->

### Anecdotal Benefits

I asked our team "What do you enjoy about promiscuous pairing?", and below are all of our answers.

> I feel much more knowledgeable and therefore comfortable with our entire codebase.

> Since we all touch each story, I feel like we each get a 'win' every time a story is completed,
> which improves our morale and makes us want to get even more stories finished.

> As a manager, it's much easier to check in on stories and see how progress is being made.

> I like the constant change up in work, it makes me feel more productive and keeps my brain sharp
> to new problems.

> Being exposed to all of the problems the team is facing and knowing how I can help the most.
> Working with all teammates on a regular basis. Good ideas that come from different viewpoints

> Learning new keyboard shortcuts and other 'tricks' from other team members.

> It was easier to stay engaged because I was constantly unsure what was going on ;)

> It really highlighted development environment issues, and we mostly managed to get the problems
> sorted out.

## Complications

Though the experiment was an overwhelming success, there were complications that we had to address.

Passing context from pair-to-pair was the most difficult complication. There were a few times when
the Jedi couldn't answer the padawn's questions, and since we weren't used to this experience we
didn't do a good job of asking the previous Jedi; instead we grumbled and complained (mostly me, the
author :smile:).

There were one or two times when someone had to leave work early for a doctor's appointment or
something, and we weren't sure what to do if they were supposed to be the Jedi. Eventually we
learned to schedule our day around such known scheduling complications so that the person who had to
leave would be Han Solo at that time, but it was difficult until we figured that out.

Eventually we learned to put lots of temporary notes in the code to capture design decisions and
todo lists which made it much easier to get onboard a padawn. In fact, we were able to get our
onboarding time down to 5 minutes and sometimes less. While this wasn't our intention, adding those
notes forced us to think through the story to discuss our assumptions, address our questions, and
sketch a rough design before we ever began writing code. Plus it helped us remember to make commits
after each todo item was finished.

Such a heavy schedule was tiring for the entire team. Since promiscuous pairing requires lots of
communication the schedule was especially taxing on our teammates who are introverted. After the
first week we relaxed our schedule ever-so-slightly, but it was still quite full and often very
tiring.

## Why Does Promiscuous Pairing Work?

We're not entirely convinced that promiscuous pairing works inherently. Rather, we think it works
because it

1. requires good habits to successfully implement
1. distributes both domain-specific and tool-specific knowledge very rapidly
1. keeps us engaged
1. improves morale
1. exposes environment issues

There are other ways to achieve these 3 things, but promiscuous pairing is the quickest way for us.

[Promiscuous Pairing paper]: http://csis.pace.edu/~grossman/dcs/XR4-PromiscuousPairing.pdf
[previous post on pairing]: https://engineering.itpro.tv/2018/10/24/how-we-work-pair-programming/
