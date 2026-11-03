# Refactor-CoA v1.0.4 — Stable release: research verdict regression fixes

Maintainer: **Uncle Bone** — https://github.com/uncle-bone/Refactor-CoA

## Fixed
- Research dropdown API exports and UI guards remain in place; no nil-function crash if a research API is unavailable.
- The Stat Weights grid now displays the selected **primary** source's actual numerical weights. Original profiles remain editable, while BisBeard historical weights are displayed read-only and never overwrite saved user weights.
- Corrected a serious equipped-score cache collision: independent primary and secondary research profiles no longer share one secondary score slot.
- Research selectors keep separate SavedVariables per character and mutually exclusive Original/Research source checkboxes per verdict.
- A new research source attempts to match the current class/spec and **never silently selects a different class's stats**.
- Research source switching reuses cached tooltip scans instead of forcing expensive rescans.
- Updated both addon TOCs, the in-game metadata version, and the in-game update URL to the official maintained repository.
- Added Lua 5.1 source syntax checks, research-state regression tests, and research TOC load-order verification to the release workflow.

## Research source caveat
BisBeard's historical numeric weights are included as reference data. The current Ascension Sidekick archive includes role/tier information, **not numeric stat priorities**. The research source must not be treated as a validated blend of two independently measured numerical models. These historical weights may be inaccurate for the current Conquest Reborn realm.

## Installation
1. **Exit WoW completely.**
2. Back up custom addon files if you modified them manually. Replace both `Interface/AddOns/Refactor` and `Interface/AddOns/RefactorGear` with the two folders from this ZIP; do not leave old files mixed into either folder.
3. **Keep `WTF` and all SavedVariables untouched.**
4. Restart the client and verify both options panels display `v1.0.4`. Older versions in-game indicate the game is still loading older addon files.
5. On Refactor Gear → Stat Weights, select Original or BisBeard + Sidekick separately for Primary and Secondary. Scroll down to view the weight grid for the selected **Primary** source. Research values are read-only.

**Stable release approved by the maintainer.** Automated checks passed; in-game results may still depend on the Conquest Reborn client and installed addons.
