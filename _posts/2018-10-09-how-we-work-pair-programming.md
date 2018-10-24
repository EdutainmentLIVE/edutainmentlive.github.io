# How We Work: Pair Programming

by Jason Fry (@JasonMFry)

![A photo of two people working at a pairing station][]
use real photo, not this one.

## Why We Pair

1. Improves our Team
    1. It forces us to become more personable, patient, and articulate
    1. It makes junior engineers and new hires more productive faster
    1. Spreads knowledge
    1. Improves our cohesion as a team
1. Improves our code
    1. Two people make better design decisions than one person
    1. Part of the Navigator's job is to spot opportunites for refactoring, so we're constantly
       refactoring out codebase

## How We Got Started Pairing

We had an outside expert recommend that we begin pairing, and when we moved into a new building in
October 2016 we took that opportunity to setup our area to make pairing easy (see
[Logistics](#Logistics) for our setup). Thankfully our leadership is very supportive of experiments;
in fact they encourage expirementation and celebrate well-intentioned failure.

## Preferred Pairing Style

There are different pairing methods, but we prefer Driver/Navigator over [Ping Pong][] because we
don't do TDD and over [Strong Style][] because it feels foreign to us, though we may occasionally do
it to shake things up. [Tour Guide][] Doesn't achieve our goals for knowledge transfer and code
quality.

We let each pair determine the specifics of each role. Below I've outlined how we _tend_ to define
each role, with the caveat that we're still figuring it out ourselves.

### Driver/Navigator

The Driver is the one who operates the keyboard and mouse. They should think out loud and voice
their expectations so that the Navigator knows what's going on.

The Navigator tends to do most everything else:

- Note opportunities for refactoring
- Keep scope of story small
- Ask for breaks on a regular basis
- Encourage the Driver to commit frequently
- Follow the storyline and stop the driver if it doesn’t make sense
- Actively confirm or reject assumptions
- Ask for arguments if a driver takes a non obvious solution: "Why did you do it that way?”
- Look for the nearest exit: “If you fix that test now we can do a commit first, the build will be
  green”

## Logistics

The logistics of how we pair is importannt because it increases our effectiveness. We almost always
drive on our own machine, but there are plenty of times when we drive on someone else's machine with
their editor so we can be more editor-agnostic.

### In-Person Pairing

In the past we paired our desks such that each desk had a monitor that mirrored what the other desk
was doing. This allowed us to stay at our own desk but still effectively pair. But we appreciate
being shoulder-to-shoulder more than remaining in the comfort of our own desk, and so have adopted
another setup.

Our (currently) prefered setup, which you can see an example of in the photo at the top of this
post, is to pair shoulder-to-shoulder with 2 mirrored monitors, 2 keyboards (only 1 active at a time
so as not to confuse roles), and 2 mice (both active so that the Navigator can point to things on
the screen). We have multiple desks that are designated as pairing stations, and while each of us
have "our own desk", we're usually working at one of the pairing stations.

### Remote Pairing

We have 1 remote engineer, plus we contract with a small company to help us improve our skills and
they are all remote. So at any given time we may have 3-4 people on our team who are remote. While
we think in-person pairing is much better than remote pairing, we have experimented with a lot of
tools to make remote pairing better.

We use Slack for a lot of our communication and it works well enough for video calls and screen
sharing. However, if we're having video issues we switch to Skype because it seems to have much
clearer video even on slower connections, and while Skype doesn't allow us to draw on each other's
screen or control their machine, that doesn't hinder us too much. Instead it improves our
communication skills because we can no longer circle the thing we're talking about, we have to use
words :wink:

For those of us who use terminal-based editors such as emacs and vim, we use [tmate][] and [SSH][],
along with an audio call using Slack or whatever the pair feels like: Hangouts, Skype, Riot,
old-fashioned telephone call, etc.

### Promiscuous Pairing

In an upcoming post we're going to discuss our (successful) experiment with promiscuous pairing as
inspired by [Promiscuous Pairing and Beginner’s Mind][] by [Arlo Belshee][]. I think you're going to
be intrigued by the discussion.

## Pairing is Great

We think pairing is great. We do nearly all of our work in pairs. It has improved our team and our
codebase, and while it may slow us down in the short-term, it definitely speeds us up in the
long-term.

[Arlo Belshee]: http://arlobelshee.com
[A photo of two people working at a pairing station]: https://cdn-images-1.medium.com/max/1600/1*eLThQSUT_xeGtRVGainpfQ.png
[Ping Pong]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#ping-pong
[Promiscuous Pairing and Beginner’s Mind]: http://csis.pace.edu/~grossman/dcs/XR4-PromiscuousPairing.pdf
[SSH]: https://www.ssh.com/ssh/
[Strong Style]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#strong-style
[tmate]: https://tmate.io
[Tour Guide]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#tour-guide
