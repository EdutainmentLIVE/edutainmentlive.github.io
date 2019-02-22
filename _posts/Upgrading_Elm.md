# Upgrading Elm from 0.18 to 0.19

Our goal with this blog post is 1) to highlight some things Elm can do differently in the future to
make the upgrade process easier, and 2) help the community upgrade their stuff.

It will be easy to slip into negative nancy mode here, instead try hard to be positive and
encouraging (K-LOVE) even when talking about the stuff that we didn't like.

## What We Like about 0.19

We haven't used it much since we updated so maybe we should change this section to 'What Went Well
While Upgrading' or something? Or ask Rob what he most likes about 0.19 to help us brainstorm.

1. Compiler is even friendlier than before. It bought me coffee!
1. More elm/ packages (elm supported, not sure what to call these)
1. Removed polymorphic `toString` function.

## What Didn't Go Well

1. Compiler was unusable until we got the dependencies correct
1. Some elm-community packages were no longer supported, and we chose those over others specifically
   because they were elm-community and were more likely to be supported, integrated, or at least
   easy to update
1. Several breaking changes
   1. Date/Posix
   1. Navigation (key)
   1. JSON decoding
   1. HTTP library
   1. Various function signatures changed without obvious benefit
1. Documentation was difficult to find for 0.18

## What We Would Like to See Done Differently when Upgrading to 0.20

1. Always have the compiler working for you
1. Keep breaking changes to a minimum unless it's an obviously better. Or be backwards compatible
   for a period of time
1. Make previous version documentation easier to find and make it easier to compare to new version,
   in case type signatures change.

## Misc Irritations

We had to fork and upgrade some dependencies because it was easier to upgrade them than to choose
another dependency, namely elm-bootstrap and elm-dropdown. That's unfortunate but it happens.
