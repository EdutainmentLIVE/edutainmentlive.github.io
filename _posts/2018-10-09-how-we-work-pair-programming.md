# How We Work: Pair Programming

by Jason Fry (@JasonMFry)

Photo of pairing station goes here

## Why We Pair

1. Improves our Team
    1. It forces us to become more personable, patient, and articulate
    1. It makes junior engineers and new hires more productive faster
    1. Increases the bus factor by spreading knowledge
    1. Improves our cohesion as a team
1. Improves our code
    1. Two people make better design decisions than one person
    1. Part of the Navigator's job is to spot opportunites for refactoring, so we're constantly
       refactoring out codebase

## Support from Leadership

## How We Pair

There are different methods, but we prefer Driver/Navigator over [Ping Pong][] because we don't do TDD
and over [Strong Style][] because it feels foreign to us, though we may occasionally do it to shake
things up. [Tour Guide][] Doesn't achieve our goals for knowledge transfer and code quality.

We let each pair determine the specifics of each role. Below I've outlined how we tend to define
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

### Logistics

- Shoulder-to-shoulder (see photo)
  - 2 monitors
  - 2 keyboards (only 1 active at a time)
  - 2 mice (both active so that the Navigator can point to things on the screen)
- Remote
  - Slack
  - [tmate][] and [SSH][]

[Ping Pong]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#ping-pong
[SSH]: https://www.ssh.com/ssh/
[Strong Style]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#strong-style
[tmate]: https://tmate.io
[Tour Guide]: https://gist.github.com/JasonMFry/d5a2f9316e270d38fcf88726ae6204d6#tour-guide
