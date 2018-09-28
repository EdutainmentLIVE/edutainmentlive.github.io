# Haskell In Production: A GHC Upgrade Success Story

Version upgrade nightmares are so common that they have become almost expected. Update the compiler one patch level, or a library version, and the work spirals into a much larger project.
This is a story of going forward two versions in GHC, and updating our libraries at the same time. Oh and doing it with minimal fuss.

To begin, I will give a quick description of the codebase and a rundown of what changed during
 the process of upgrading.

The codebase is a relatively young project at around 6 months old. However it is already well
 established within the company and in production. The code is written in Haskell, using the stack build tool.
 Other tools used include the linter Hlint, and recently added brittany as the format tool in place
 of hindent, as well as some custom helper scripts for pulling all of this together.
The tools have configuration version controlled with the code. Futher we distribute specific
 versions of the tools via containers to keep everyone in sync.

# Size of Codebase and Changes
Let's start with how big the codebase is to give something to compare the changes against. The
 Haskell codebase is less than a year old and still growing. As of this writing the number of real
 lines of Haskell, opposed to blank or comment lines, as reported by the cloc utility is just a hair under 21
 thousand. That is excluding any helper scripts, configuration files, and so on.

Now, what did we have to change for this? Well the lines changed directly due to the upgrade of
 GHC was a grand total of 1. That's right, only a single line. There is a bit of a trick in that
phrasing though. Also updated were our libraries. So going back and tracing through the lines
 changed for libraries comes to a total of 2 lines.

Previously I mentioned that we use Hlint, and that we version control the configuration and tool
 itself. Upgrading our tools included upgrading Hlint, which gave us a couple of new hints. Also,
 was the removal of two hints we had previously ignored. So our configuration file shrunk! We
 removed two hints and added another, another pretty small change to make. But how did this change
 the codebase? Great question, it was 12 lines changed and 2 deleted.

You might wonder, why all the specific numbers? For two reasons, to highlight how much code
 change was needed, and to show how much of the work done for the change was in the supporting
 items around the code itself. To that first reason, the total lines of Haskell came to 15 lines
 changed, and 2 removed. Meaning less than 0.1% of the entire codebase needed changes! The final
 pull request included 239 additions and 232 deletions. So the vast majority of change took place
in cleaning and updating our containers, helper scripts, and other support for the code rather
than the code itself.

## Development Speed

Speed of tooling can be either a real drag on getting work done, or if acceptable is often overlooked.
 Our Haskell codebase compiles quite quickly on GHC-8.0. But what about the new version you might ask,
 expecting to hear a gotcha finally come in. It is even faster! Significantly so. Across 100 iterations
 of building GHC-8.4 came out 24 percent faster on average.

Now To give some hard numbers. These are taken from a development machine by a small script to
 measure the time to build the project after cleaning. The GHC-8.0 had a mean build time of approximately 191 seconds
 and a standard deviation of 7.5 seconds. After the upgrade to 8.4 the mean build time was 144 seconds,
 with a standard deviation of 2.8 seconds. Notice the standard deviation difference, it is less than
 half of what it was previously! So we got a faster *and* more consistent development experience from
 the upgrade.

# Staying Prepared

How did we manage to jump two compiler versions, and update our libraries with so few changes to
 the codebase?  There are three major contributors to this, compiling with -Wcompat, using stackage
 and keeping our tooling version controlled in the first place.

## Wcompat

GHC offers Wcompat as a flag to turn on warnings due to be turned on by default in the future, but
 that have not yet been enabled. Enabling this, along with turning those warnings into errors,
 means that we keep at least some future issues out of the codebase.

## Stackage

Libraries can be a headache trying to get all the dependencies resolved and working with a given
 language upgrade, as anyone with "cabal hell" experience can attest to. Thankfully Stackage
 has taken almost all of the pain out of this. We attempt to limit ourselves to libraries and
 versions of those libraries that exist in a Stackage resolver, which means the work of compiling
 dependencies together has already been done for us. At this writing we have exactly 3 libraries
 that we pull in as "extra-deps", from outside the upstream resolver. Also, we continue to work
 towards those being available upstream with multiple team-members now having contributed to
 Stackage.

## Version Controlled Tools

Keeping our tools and configurations version controlled also helps us stay prepared for updates.
By having the team not drift on tooling versions, we have the ability to know if an update will
 cause workflow disruptions. Because we move the entire toolchain together, a single person can
 test that the tooling works, and if it does, then everyone will be able to update in a controlled
 manner, without having to check if all possible combinations of versions work.

# End Result

Haskell brings a large number of advantages like the strong type system, active community,
 and a focus on correctness without a large performance sacrifice. Now we can add an experience
 of ability to upgrade to this list for us. As our codebase continues to grow and evolve, the
 ability to take advantage of improvements from the tools is a great win. This extends beyond
 just us, and to anyone able to take advantage of this.
