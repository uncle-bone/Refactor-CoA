# Refactor-CoA v1.0.3 hotfix

- UI now resolves research API directly from the research module when shared exports are missing.
- Missing research module shows a clear warning rather than crashing all settings.
- Fix research dropdown refresh and source selection nil-function failures.
- Update both addon TOC versions to 1.0.3; the in-game footer uses the installed TOC version.
- Historical research weights are experimental and not live verified.

**Installation:** Exit WoW completely. Delete only `Interface/AddOns/Refactor` and `Interface/AddOns/RefactorGear` (NOT WTF or SavedVariables). Extract both new folders from the ZIP. Restart WoW; the footer must show v1.0.3.
