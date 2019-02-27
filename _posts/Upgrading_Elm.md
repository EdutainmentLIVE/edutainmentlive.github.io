# Upgrading Elm from 0.18 to 0.19
by Sara Lichtenstein (@saralich)

[Elm](https://elm-lang.org/) is a front-end, functional language that compiles to JavaScript for seamless web development, and we love it. It's been around for years and in August of 2018 it upgraded to version 0.19. We didn't get around to upgrading our app to 0.19 until January of 2019. This is our experience.

The creator of Elm released [this upgrade guide](https://github.com/elm/compiler/blob/a968e817e65d30493c344ac96c9c904b19a7f038/upgrade-docs/0.19.md) as well as [this document about what changed](https://elm-lang.org/blog/small-assets-without-the-headache), both were helpful but neither was an end-all answer. In this post, we will go over what didn't go well for us, changes we as a team would suggest, and the wonderful things about Elm 0.19 that make this upgrade worth the potential struggle.

## What Didn't Go Well For Us

1. Several breaking changes
   1. Date/Posix
   1. Navigation (key)
   1. JSON decoding
   1. HTTP library
   1. Various function signatures changed without obvious benefit
1. With breaking changes comes a broken compiler, which would not be revived until dependencies were sorted through. This is especially noticeable with Elm, whose compiler is very friendly and helpful, so not having it available was both obvious and painful. While that does make some sense, having a working compiler to guide us through how to use new dependencies would have been helpful in figuring out what was broken more efficiently.
1.  The old documentation became tough to find - the 0.19 documents replaced 0.18 on elm-lang, and after some digging we were able to find a Github site that contained the 0.18 docs, but then that went away and it was some time before we discovered their (hopefully permanent) location [here](https://dmy.github.io/elm-0.18-packages/). It was good they were somewhere, but some link between 0.19 and 0.18 would have been helpful.
1. Some elm-community packages were no longer supported, and we chose those over others specifically because they were elm-community and were more likely to be supported, integrated, or at least easy to update.
1. We had to fork and upgrade some dependencies because it was easier to upgrade them than to choose another dependency, namely [elm-bootstrap](https://github.com/rundis/elm-bootstrap) and [elm-dropdown](https://github.com/sporto/elm-dropdown). That's unfortunate but it happens.

## Potential Upgrade Changes

1. As noted, having a working compiler, especially elm's friendly compiler, makes working through kinks much easier. With 0.19, the compiler and packages have to be upgraded simultaneously. If these were to be separated, allowing for one to be upgraded at a time, the upgrade process would be much smoother in both scenarios.
1. While breaking changes can be necessary, it would be nice to have a bridge in-between in order to help acclimate to a breaking change - for example, introducing breaking changes but allowing for compiler compatibility in an 0.18.5 version in order to make the change over from 0.18 to 0.19 smoother.
1. Make previous version documentation easier to find and make it easier to compare to new version, in case type signatures change. A lot of the documentation available for other languages allows a user to select versions to look at in order to compare between versions.

## What We Like about 0.19

 1. More elm/ packages, such as browser, json, svg, time, and url. We love having elm/ packages, because they are more likely to be kept up by the community and integrated into future Elm upgrades.
 1. Removed polymorphic `toString` function, which was replaced by Int.toString. This is good because explicit type safety.
