# Refactor-CoA

> **[Latest testing prerelease v1.0.4](https://github.com/uncle-bone/Refactor-CoA/releases/download/v1.0.4/Refactor-CoA-v1.0.4.zip)** | [Stable v1.0.0](https://github.com/uncle-bone/Refactor-CoA/releases/download/v1.0.0/Refactor-CoA-v1.0.0.zip) | [All releases](https://github.com/uncle-bone/Refactor-CoA/releases)

Two separate addons for Ascension Conquest of Azeroth / Conquest Reborn (WoW 3.3.5a, Lua 5.1):

- **Refactor:** quality-of-life, loot, merchant, quest, tooltip and crowd-control alert features.
- **Refactor Gear:** independent weighted-stat gear comparisons, bag upgrade indicators, and loot upgrade alerts.

Install by extracting **both top-level folders**, `Refactor/` and `RefactorGear/`, directly into `Interface/AddOns/`. Both can be enabled or disabled independently. Existing SavedVariables should be preserved.

## v1.0.4 research-verdict prerelease

On the Stat Weights page, each Primary and Secondary verdict row has exclusive Original and BisBeard + Sidekick source checkboxes and independent profile dropdowns. Original is selected by default. The research source uses historical BisBeard numerical weights, with Sidekick class/spec role context; Sidekick tier rankings are not converted into fabricated numerical weights. Per-character selections do not overwrite saved original profiles. The selected **primary** weight grid displays its source, with research weights read-only; the secondary source scores independently. If the AddOns list or either options panel displays an older version, fully exit WoW and replace both addon folders without touching `WTF`/SavedVariables. GitHub Actions checks Lua 5.1 syntax and research state; live-client testing is still pending. See [release notes](RELEASE-NOTES.md).

## Research integration policy

[CoA-Research v2.0.1](https://github.com/uncle-bone/CoA-Research/releases/tag/shared-database-v2.0.1) includes historical source extracts and candidate class, spell, and item relationships. These records are **not live-verified gear stat weights, equipment permissions, or crowd-control mechanics**. Refactor uses client-rendered equipped-item tooltips and current player talent tabs rather than importing unverified static relationships. No unverified research candidates have been enabled as gameplay rules.

## Maintainer

Uncle Bone — https://github.com/uncle-bone
