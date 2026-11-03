-- Offline Lua 5.1 smoke tests: no WoW client required.
-- Exercises the real research module against isolated SavedVariables.
RefactorGearInternal = {
    CharKey = function() return "TestNecro-TestRealm" end,
    WipeScanCache = function() end,
    WipeInstanceScans = function() end,
    RefreshOpenBags = function() end,
    RefreshConfig = function() end,
}
UnitClass = function() return "Necromancer", "NECROMANCER" end
RefactorGearDB = {
    activeProfile = "Necromancer - Animation",
    charSecondaryProfile = {},
    profiles = { ["Necromancer - Animation"] = {weights={STR=99}} },
}
local originalWeights = RefactorGearDB.profiles["Necromancer - Animation"].weights
assert(loadfile("RefactorGear/Compare/02_research.lua"))()
local C = RefactorGearInternal
local names = C.GetResearchVerdictNames()
assert(#names == 70, "expected exactly 70 research profiles")
assert(C.GetResearchVerdictSource("primary") == "original")
assert(C.GetResearchVerdictSource("secondary") == "original")
assert(C.GetResearchVerdictProfile("primary") == nil)
C.SetResearchVerdictSource("primary", "research")
assert(C.GetResearchVerdictSource("primary") == "research")
assert(C.GetResearchVerdictSource("secondary") == "original")
assert(C.GetResearchVerdictName("primary") == "Necromancer - Animation")
local primary = C.GetResearchVerdictProfile("primary")
assert(primary and primary.weights and primary.weights.STR ~= 99)
assert(primary == C.GetResearchVerdictProfile("primary"), "identity must be stable")
C.SetResearchVerdictProfile("secondary", "Necromancer - Death")
C.SetResearchVerdictSource("secondary", "research")
assert(C.GetResearchVerdictSource("primary") == "research")
assert(C.GetResearchVerdictSource("secondary") == "research")
local secondary = C.GetResearchVerdictProfile("secondary")
assert(secondary and secondary ~= primary, "two verdicts must have distinct profiles")
C.SetResearchVerdictSource("primary", "original")
assert(C.GetResearchVerdictSource("primary") == "original")
assert(C.GetResearchVerdictSource("secondary") == "research")
assert(RefactorGearDB.profiles["Necromancer - Animation"].weights == originalWeights)
assert(originalWeights.STR == 99, "original user weights must not be overwritten")
C.SetResearchVerdictProfile("secondary", nil)
assert(C.GetResearchVerdictProfile("secondary") == nil, "None disables secondary research")
C.SetResearchVerdictProfile("secondary", "Invalid - Spec")
assert(C.GetResearchVerdictName("secondary") == nil, "unknown spec must be rejected")
C.SetResearchVerdictProfile("secondary", "Necromancer - Rime")
assert(C.GetResearchVerdictProfile("secondary") ~= nil)
RefactorGearInternal.CharKey = function() return "AnotherChar-TestRealm" end
assert(C.GetResearchVerdictSource("primary") == "original", "new character must default to original")
assert(C.GetResearchVerdictSource("secondary") == "original", "secondary must default to original")
print("Research verdict Lua 5.1 smoke tests passed; 70 profiles and source isolation")
