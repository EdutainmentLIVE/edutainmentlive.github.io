# My Infatuation With Elm

by Cameron Gera (@gera-cameron)

[Elm](https://elm-lang.org/) is a functional language that is super reliable and offers NO runtime exceptions! It compiles down to vanilla javascript so it makes it easy to work in all browsers.
There are a lot of incredible things in Elm, but I am going to touch on the following:

- Tooling
- Compiler
- Easy to start with an existing application

But before I get there, I'd like to tell you my Elm origin story.
I have been working with Elm for a year and a half, but I feel like I've known it my entire life.
I'm not going to lie, in the beginning it was tough to understand the architecture and the syntax since I was coming from Angular and Javascript as the main front-end languages I was familiar with.
But over time and many compiler errors, things started to click in ways I never really thought would be possible.
As a full-stack engineer, Elm makes me want to shift and become a front-end engineer full time.
But enough about me, let's get started!

## Tooling
This is a section that I could just write a whole blog about.
The tooling is one of my favorite things about Elm.
I'll start with the formatter, [Elm Format](https://github.com/avh4/elm-format).
This formatter is uniquely opinionated and not very customizable.
One of the frustrating parts, when I say **uniquely** opinionated, is that it will allow you to have a line that extends past your desired buffer length.
Even so, whenever I walk into a formatted Elm file, I feel like I am relaxing in a sparse forest with plenty of fresh air.
It has a few quirks like always having 2 new lines between any two blocks of code and it tends to freak out when comments are in the middle of functions.
To me those things are minor in comparison to the ability the formatter gives me to write sloppy code, then poof it is magically beautiful.
Another amazing thing it does is alphabetizes the import list which makes finding imports so easy a caveman could do it.
Consistent formatting also allows beginners to come in and more easily read what is happening in the code.

Another aspect of the tooling that I am a fan of is the tool called [Elm Analyse](https://stil4m.github.io/elm-analyse/).
This tool is used to lint the Elm files.
It tells you about unused imports and variables, as well as whether or not all your files are formatted.
Elm Analyse is fairly customizable, meaning you can turn off and on various features.
Another feature that I haven't personally used is that it can detect outdated dependencies.
This is helpful to keep up to date with package changes without having to check Elm Package.
I'm thankful that this tool has allowed our code base to stay consistent and keep out minor syntactic garbage.

The [Elm Package](https://package.elm-lang.org/) manager is also another aspect I enjoy about Elm because it is easy to read and understand.
It allows you to search for packages and presents the results in a useful, well-formatted, attractive layout, unlike lots of other documentations.
This allows me to find the functions I need to solve most of my needs.
Like most package managers it links well to the related functions and types.
I do wish that Elm Package allowed me to insert a type signature and return related functions with that type signature, like Haskell, but fortunately, there is another tool that does, called [Elm Search](https://klaftertief.github.io/elm-search/).
The previous two tooling points are by far my favorite, but I do appreciate a nice package manager and good version management.
Publishing a personal package is another story that I'll touch on later, but for now let us move on.

## Compiler

I **LOVE** Elm's compiler.
It's instruction is like that of a caring mother who just wants you to succeed even when you try and cause chaos through your code.
Besides that, it gives you a ton of confidence when writing new code or refactoring ancient code.
If I asked my coworkers, I am sure that they would say it is their favorite compiler, even if most of their compiler experience is with Haskell.
Its ability to use type inference to find all the edge cases ensures that your program does not have any runtime errors, which blows my mind.
It also compiles quickly, which helps with development time.
I have been impressed with the recent improvements to the compiler in the newest version, Elm 0.19.

## Easy to start with an existing application

Another really nice aspect of Elm is the ability to give it a shot in your existing app.
At work we have an Angular 1.5 application that we are currently changing over to Elm piece by piece.
This is allowing us to provide incremental changes to our users so we can get feedback quickly as we make massive improvements to our product. Otherwise, trying to rewrite our entire app in Elm would take quite a load of resources.
We also don't have to worry about waiting to deploy a new app until it's completed.
So far our leadership has really enjoyed seeing these new UI's and fewer bugs.

I would really encourage you to give this idea a try because it is as easy as creating a div element that Elm can take over and control.
This could be a whole page or a single element, like a navigation bar.
If it doesn't work out that's okay, at least you didn't build an entire app in a language that wasn't the right fit.

## Wrapping up

I love Elm, plain and simple.
It's has great tooling, a top notch compiler, and is super easy to get started.
I encourage you to jump in!
Although it isn't perfect, it is pretty close.
Some of the things it could work on would be adding type classes, better instruction around publishing of packages, and not causing insane breaking changes between versions.
I am sure other people have differing opinions, but I genuinely enjoy programming in Elm.
