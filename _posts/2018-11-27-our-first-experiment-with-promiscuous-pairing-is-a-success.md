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
that story as the next padawn. The padawn nearly always drove the entire time while the Jedi
navigated.

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

<!-- list anecdotal benefits, such as "feel more knowledgeable of our codebase", etc -->

## Complications

Though the experiment was an overwhelming success, there were complications that we had to address.

### Scheduling

<!-- our company standup is 0830, making our morning 3 hours -->

### Passing Context

<!-- got better very quickly, though difficult the first week -->

## Why Does Promiscuous Pairing Work?

We're not entirely convinced that promiscuous pairing works inherently. Rather, we think it works
for three reasons

1. it requires good habits to successfully implement
1. it distributes both domain-specific and tool-specific knowledge very rapidly
1. it keeps us engaged

There are other ways to achieve these 3 things, but promiscuous pairing is the quickest way for us.

### Brain Dump

Info I've written that may or may not find a place in the final post.

At the beginning of every story we write a todo list in the code in comments so that everyone who
picks up the story can, at a glance, know roughly where we are. The todo list doesn't eliminate the
need for the Jedi to pass context to the Padawn, but it helps. But more importantly it forces us to
think through the story to discuss our assumptions, address our questions, and sketch a rough
design. Plus it helps us remember to make commits after each item is finished.

[Promiscuous Pairing paper]: http://csis.pace.edu/~grossman/dcs/XR4-PromiscuousPairing.pdf
[previous post on pairing]: https://engineering.itpro.tv/2018/10/24/how-we-work-pair-programming/
