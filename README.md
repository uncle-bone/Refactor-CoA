# Refactor-CoA

**Less busywork. Smarter gear decisions. More time playing.**

Refactor-CoA packages two separate, complementary World of Warcraft addons—**Refactor** and **Refactor Gear**—in one convenient download for **Ascension Conquest of Azeroth / Conquest Reborn (WoW 3.3.5a)**. Each addon retains its own code, configuration, minimap button, saved variables, and enable/disable controls.

## Refactor — Quality-of-life improvements

Refactor streamlines routine gameplay without forcing you into an all-or-nothing automation setup.

- **Fast looting and animated loot notifications** with item details and optional auction-value information.
- **Crowd-control warnings** with prominent icons and countdowns for stuns, fears, polymorphs, and other effects.
- **Quest automation** for accepting, turning in, and navigating dialogue; optional reward selection when Refactor Gear is installed.
- **Merchant conveniences** such as selling junk and repairing equipment.
- **Transmog collection** automation for eligible appearances.
- **Tooltip improvements**, optional error-message and sound reduction, and social conveniences.
- **Bag-management tools** and individually configurable tweaks.

Many automation options are off by default, and supported actions can be bypassed with Shift.

## Refactor Gear — Equipment comparisons

Refactor Gear helps identify potential upgrades using customizable weighted-stat scoring.

- **Upgrade verdicts in tooltips**, including percentage comparisons against equipped items.
- **Colored bag arrows** to identify possible upgrades and items that require a higher level.
- **Class/spec stat-weight profiles**, custom profiles, and an optional secondary profile for alternate builds.
- **Quest reward, loot roll, and vendor comparisons** alongside loot upgrade notifications.
- **Smart equip behavior** for rings, trinkets, and weapons.
- **Optional hit-rating caps** and configurable item-quality filters.

Scoring uses available live item information to better handle Ascension's customized item scaling. If reliable stats cannot be read, the addon should avoid guessing.

## Better together, still separate

Install either addon alone or both together. When both are enabled, their existing integration lets Refactor show gear-upgrade information in loot notifications, use Refactor Gear's scoring for eligible quest reward choices, and coordinate bag-handling actions.

**These addons are not merged into one codebase.** They are simply distributed together in one ZIP.

## Installation

1. Download the latest Refactor-CoA release ZIP.
2. Extract the two folders, `Refactor` and `RefactorGear`, into `World of Warcraft/Interface/AddOns/`.
3. Enable either or both addons on the character-selection AddOns screen.

Open Refactor with its minimap button or `/rfc`. Open Refactor Gear with its minimap button or `/rfg`.

## Compatibility and development

- **Target:** Ascension Conquest of Azeroth / Conquest Reborn
- **Client:** World of Warcraft 3.3.5a (`Interface: 30300`)
- **UI targets:** Blizzard default UI, DragonUI, and ElvUI
- **Current package baseline:** v1.0.0

Compatibility and class/spec-specific gear weights are ongoing testing priorities; features listed above describe the inherited upstream capabilities, not a guarantee that every interaction has been validated on Conquest Reborn.

## Maintainer and origins

**Maintained for Conquest Reborn by Uncle Bone** · [downingwow](https://github.com/downingwow)

This package builds on the original open-source work by **ProfetGit**:

- [Refactor-Ascension](https://github.com/ProfetGit/Refactor-Ascension)
- [RefactorGear](https://github.com/ProfetGit/RefactorGear)

Both original projects use the **MIT License**. Preserve their original copyright and license notices when distributing modified versions.
