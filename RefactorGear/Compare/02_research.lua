-- Historical BisBeard planner stat weights, research-only until explicitly selected.
-- Source: https://github.com/Nalhan/Bestow/blob/main/Data/StatWeights.lua
-- Captured 2026-07-31; historical, not live-verified Conquest Reborn.
-- Sidekick provides role and tier context, not numerical weights.
-- Keys map to RefactorGearInternal.STATS; duplicate synonyms are not summed.
local C = RefactorGearInternal
C.ResearchWeights = {
  ["Barbarian - Headhunting"] = { role = "ranged", weights = { AGI = 1.473, ARP = 0.45, AP = 1, CRIT = 0.65, HASTE = 0.6, DPS = 14 } },
  ["Barbarian - Brutality"] = { role = "melee", weights = { AGI = 2.195, ARP = 0.45, AP = 1, CRIT = 0.761, EXP = 0.5, HASTE = 0.6, HIT = 0.5, STR = 2.188, DPS = 14 } },
  ["Barbarian - Ancestry"] = { role = "support", weights = { AGI = 1.387, ARP = 0.25, AP = 1, CRIT = 0.5, EXP = 0.5, HASTE = 0.55, HIT = 0.5, STR = 1 } },
  ["Witch Doctor - Shadowhunting"] = { role = "hybrid", weights = { AGI = 2, ARP = 0, AP = 1, CRIT = 0.672, HASTE = 0.5, INT = 1.2, DPS = 14, SP = 0.2 } },
  ["Witch Doctor - Voodoo"] = { role = "caster", weights = { CRIT = 1.238, HASTE = 0.6, INT = 0.173, SP = 1, SPI = 1.504 } },
  ["Witch Doctor - Brewing"] = { role = "healer", weights = { CRIT = 0.5, HASTE = 0.65, SP = 1, INT = 0.07, SPI = 0.3 } },
  ["Felsworn - Infernal"] = { role = "caster", weights = { CRIT = 1.242, HASTE = 0.6, INT = 0.414, SP = 1, SPI = 0.517 } },
  ["Felsworn - Slayer"] = { role = "hybrid", weights = { AGI = 2.5, ARP = 0.3, AP = 1, CRIT = 0.734, EXP = 0.5, HASTE = 0.6, INT = 0, SP = 0, STR = 1, DPS = 14 } },
  ["Felsworn - Tyrant"] = { role = "tank", weights = { AGI = 2.817, ARMOR = 0.5, ARP = 0.15, AP = 1, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, PARRY = 0.9, STA = 2, STR = 1.135, DPS = 14 } },
  ["Witch Hunter - Boltslinger"] = { role = "hybrid", weights = { AGI = 1.342, ARP = 0.3, AP = 1, CRIT = 0.813, HASTE = 0.6, INT = 1.104, DPS = 14, SP = 0.5 } },
  ["Witch Hunter - Houndmaster"] = { role = "hybrid", weights = { AGI = 1.375, ARP = 0.3, AP = 1, CRIT = 0.891, HASTE = 0.6, INT = 0.336, DPS = 14, SP = 0.5 } },
  ["Witch Hunter - Inquisition"] = { role = "hybrid", weights = { AGI = 1.745, ARP = 0.3, AP = 1, CRIT = 0.644, EXP = 0.5, HASTE = 0.6, INT = 1.082, SP = 0.75, STR = 1, DPS = 14 } },
  ["Stormbringer - Wind"] = { role = "support", weights = { CRIT = 0.5, HASTE = 0.55, HIT = 0.5, INT = 0.067, SP = 1 } },
  ["Stormbringer - Maelstrom"] = { role = "caster", weights = { CRIT = 0.882, HASTE = 0.6, INT = 0.244, SP = 1 } },
  ["Stormbringer - Lightning"] = { role = "caster", weights = { CRIT = 1.563, HASTE = 0.6, HIT = 0.5, INT = 0.209, SP = 1 } },
  ["Knight of Xoroth - Hellfire"] = { role = "hybrid", weights = { AGI = 0.585, ARP = 0.3, AP = 0.75, CRIT = 0.831, EXP = 0.5, HASTE = 0.6, HIT = 0.5, INT = 1.163, SP = 1, STR = 2.2, DPS = 14 } },
  ["Knight of Xoroth - Defiance"] = { role = "tank", weights = { AGI = 1.127, ARMOR = 0.2, ARP = 0.15, AP = 1, BLOCK = 0.75, CRIT = 0.376, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.064, PARRY = 0.9, SP = 0.75, STA = 1.06, STR = 2.549, DPS = 14 } },
  ["Knight of Xoroth - War"] = { role = "melee", weights = { AGI = 0.721, ARP = 0.45, AP = 1, CRIT = 1.024, EXP = 0.5, HASTE = 0.6, STR = 2.398, DPS = 14 } },
  ["Guardian - Gladiator"] = { role = "melee", weights = { AGI = 0.592, ARP = 0.45, AP = 1, CRIT = 0.764, EXP = 0.5, HASTE = 0.6, STR = 2.464, DPS = 14 } },
  ["Guardian - Inspiration"] = { role = "support", weights = { AGI = 0.444, ARP = 0.25, AP = 1, CRIT = 0.6, EXP = 0.5, HASTE = 0.55, HIT = 0.5, STR = 2.16 } },
  ["Guardian - Vanguard"] = { role = "tank", weights = { AGI = 1, ARMOR = 0.3, ARP = 0.15, AP = 1, BLOCK = 0.75, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, PARRY = 0.9, STA = 3, STR = 2, DPS = 14 } },
  ["Templar - Oathkeeper"] = { role = "tank", weights = { AGI = 2.872, ARMOR = 0.4, ARP = 0.15, AP = 1, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.2, PARRY = 0.9, STA = 1.05, STR = 1.333, DPS = 14 } },
  ["Templar - Zealot"] = { role = "hybrid", weights = { AGI = 1.844, ARP = 0.3, AP = 1, CRIT = 0.678, EXP = 0.5, HASTE = 0.6, INT = 0.091, SP = 1, STR = 1.365, DPS = 14 } },
  ["Templar - Crusader"] = { role = "hybrid", weights = { AGI = 1.713, ARP = 0.3, AP = 1, CRIT = 0.739, EXP = 0.5, HASTE = 0.6, INT = 0.215, SP = 1, STR = 1.05, DPS = 14 } },
  ["Bloodmage - Fleshweaver"] = { role = "support", weights = { CRIT = 0.5, HASTE = 0.6, SP = 1, INT = 0.091, SPI = 0.621 } },
  ["Bloodmage - Sanguine"] = { role = "caster", weights = { CRIT = 0.9, HASTE = 0.6, INT = 0.165, SP = 1, SPI = 0.27, STA = 0.27 } },
  ["Bloodmage - Accursed"] = { role = "hybrid", weights = { AGI = 1.866, ARP = 0.3, AP = 1, CRIT = 0.653, EXP = 0.5, HASTE = 0.6, HIT = 0.5, INT = 0.119, SP = 0.75, STR = 1.323, DPS = 14 } },
  ["Ranger - Archery"] = { role = "hybrid", weights = { AGI = 1.445, ARP = 0.3, AP = 1, CRIT = 0.631, HASTE = 0.6, HIT = 0.5, INT = 0.054, DPS = 0, SP = 0.15 } },
  ["Ranger - Farstrider"] = { role = "support", weights = { AGI = 1.39, ARP = 0.2, AP = 1, CRIT = 0.53, HASTE = 0.55, HIT = 0.5, DPS = 0 } },
  ["Ranger - Brigand"] = { role = "melee", weights = { AGI = 1.567, ARP = 0.45, AP = 1, CRIT = 0.705, EXP = 0.5, HASTE = 0.6, HIT = 0.5, STR = 1, DPS = 14 } },
  ["Chronomancer - Time"] = { role = "healer", weights = { CRIT = 0.5, HASTE = 0.65, SP = 1, INT = 0.064, SPI = 0.575 } },
  ["Chronomancer - Infinite"] = { role = "caster", weights = { CRIT = 0.75, HASTE = 0.6, INT = 0.096, SP = 1, SPI = 0.46 } },
  ["Chronomancer - Artificer"] = { role = "caster", weights = { AGI = 1.1, ARP = 0, AP = 1, CRIT = 0.7, HASTE = 0.9, HIT = 0, INT = 0.1, DPS = 14, SP = 0.7, SPI = 1.5 } },
  ["Necromancer - Death"] = { role = "caster", weights = { CRIT = 0.63, HASTE = 0.6, INT = 0.054, SP = 1 } },
  ["Necromancer - Animation"] = { role = "caster", weights = { CRIT = 0.6, HASTE = 0.6, HIT = 0.5, INT = 0.051, SP = 1 } },
  ["Necromancer - Rime"] = { role = "caster", weights = { CRIT = 0.9, HASTE = 0.6, INT = 0.415, SP = 1 } },
  ["Pyromancer - Flameweaving"] = { role = "healer", weights = { CRIT = 0.9, HASTE = 0.65, SP = 1, INT = 0.129, SPI = 2.182 } },
  ["Pyromancer - Incineration"] = { role = "caster", weights = { CRIT = 1.242, HASTE = 0.6, HIT = 0.5, INT = 0.345, SP = 1 } },
  ["Pyromancer - Draconic"] = { role = "caster", weights = { CRIT = 1.614, HASTE = 0.6, HIT = 0.5, INT = 0.218, SP = 1 } },
  ["Cultist - Heretic"] = { role = "hybrid-healer", weights = { ARP = 0.2, AP = 1, CRIT = 3, HASTE = 0.4, SP = 0.4, INT = 0.104, DPS = 14, STR = 1 } },
  ["Cultist - Corruption"] = { role = "caster", weights = { CRIT = 0.9, HASTE = 0.6, INT = 0.507, SP = 1 } },
  ["Cultist - Godblade"] = { role = "hybrid", weights = { ARP = 0.3, AP = 1, CRIT = 0.797, EXP = 0.5, HASTE = 0.6, HIT = 0.5, INT = 1.271, SP = 0.25, STR = 2.268, DPS = 14 } },
  ["Starcaller - Moon Priest"] = { role = "healer", weights = { CRIT = 0.505, HASTE = 0.65, SP = 1, INT = 1 } },
  ["Starcaller - Sentinel"] = { role = "hybrid", weights = { AGI = 1.366, ARP = 0.3, AP = 1, CRIT = 0.778, HASTE = 0.1, INT = 2.1, DPS = 14, SP = 0.25 } },
  ["Starcaller - Warden"] = { role = "hybrid", weights = { AGI = 0.829, ARP = 0.3, AP = 0.5, CRIT = 0.7, EXP = 0, HASTE = 0.6, INT = 2, DPS = 14, SP = 1, STR = 0.55 } },
  ["Sun Cleric - Piety"] = { role = "caster", weights = { CRIT = 1.5, HASTE = 0.6, INT = 0.21, SP = 1 } },
  ["Sun Cleric - Valkyrie"] = { role = "hybrid", weights = { AGI = 0.445, ARP = 0.3, AP = 1, CRIT = 0.625, EXP = 0.5, HASTE = 0.6, INT = 0.088, SP = 0.25, STR = 2.4, DPS = 14 } },
  ["Sun Cleric - Seraphim"] = { role = "tank", weights = { AGI = 1.32, ARMOR = 0.256, ARP = 0.15, AP = 0.5, BLOCK = 0.75, CRIT = 0.363, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.697, PARRY = 0.9, SP = 1, STA = 1.15, STR = 2.771, DPS = 14 } },
  ["Tinker - Demolition"] = { role = "hybrid", weights = { AGI = 1.878, ARP = 0.3, AP = 1, CRIT = 0.644, HASTE = 0.6, INT = 1.205, DPS = 14, SP = 1 } },
  ["Tinker - Mechanics"] = { role = "hybrid", weights = { AGI = 1.375, ARP = 0.3, AP = 1, CRIT = 0.705, HASTE = 0.6, INT = 1.219, DPS = 14, SP = 0.15 } },
  ["Tinker - Invention"] = { role = "healer", weights = { CRIT = 0.5, HASTE = 0.65, SP = 1, INT = 0.442, DPS = 14 } },
  ["Venomancer - Fortitude"] = { role = "tank", weights = { AGI = 2.529, ARMOR = 0.34, ARP = 0.15, AP = 0.5, CRIT = 0.357, DEF = 1.05, DODGE = 0.9, EXP = 0, HASTE = 0.35, HIT = 0, INT = 0.05, PARRY = 0.9, SP = 1, STA = 1, STR = 0.8, DPS = 14 } },
  ["Venomancer - Stalking"] = { role = "hybrid", weights = { AGI = 0.4, ARP = 0, AP = 0.2, CRIT = 1, EXP = 0.5, HASTE = 0.8, INT = 1, DPS = 0, SP = 1, STR = 0 } },
  ["Venomancer - Rotweaver"] = { role = "caster", weights = { CRIT = 1.2, HASTE = 0.6, HIT = 0.5, INT = 0.575, SP = 1 } },
  ["Reaper - Soul"] = { role = "melee", weights = { AGI = 0.485, ARP = 0.45, AP = 1, CRIT = 0.689, EXP = 0.5, HASTE = 0.6, STR = 2.2, DPS = 14 } },
  ["Reaper - Harvest"] = { role = "melee", weights = { AGI = 0.471, ARP = 0.45, AP = 1, CRIT = 0.67, EXP = 0.5, HASTE = 0.6, HIT = 0.5, STR = 2.347, DPS = 14 } },
  ["Reaper - Domination"] = { role = "tank", weights = { AGI = 1.53, ARMOR = 0.37, ARP = 1.35, AP = 1, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, PARRY = 0.9, STA = 1.2, STR = 2.596, DPS = 14 } },
  ["Primalist - Grovekeeper"] = { role = "support", weights = { AGI = 0.374, ARP = 0.2, AP = 1, CRIT = 0.5, HASTE = 0.6, SP = 1, INT = 0.093, STR = 2.2, DPS = 14 } },
  ["Primalist - Wildwalker"] = { role = "melee", weights = { AGI = 0.486, ARP = 0.45, AP = 1, CRIT = 0.65, EXP = 0.5, HASTE = 0.6, STR = 2.2, DPS = 14 } },
  ["Primalist - Mountain King"] = { role = "tank", weights = { AGI = 0.8, AP = 1, CRIT = 0.5, DEF = 1.5, DODGE = 1.2, EXP = 1.5, HASTE = 1.5, HIT = 1.1, PARRY = 2, SP = 0.5, STA = 2, STR = 4, DPS = 10 } },
  ["Runemaster - Engravement"] = { role = "hybrid", weights = { AGI = 1.429, ARP = 0, AP = 1, CRIT = 0.2, EXP = 0.5, HASTE = 0.6, INT = 0.109, DPS = 14, SP = 0.5, STR = 1.125 } },
  ["Runemaster - Glyphic"] = { role = "caster", weights = { CRIT = 0.69, HASTE = 0.6, INT = 0.239, SP = 1, SPI = 0.33 } },
  ["Runemaster - Riftblade"] = { role = "hybrid", weights = { AGI = 1.643, ARP = 0, AP = 1, CRIT = 0.2, EXP = 0.5, HASTE = 0.6, INT = 0.144, DPS = 14, SP = 0.25, STR = 1 } },
  ["Primalist - Geomancy"] = { role = "caster", weights = { ARP = 0.6, CRIT = 0.654, HASTE = 0.6, HIT = 0.5, INT = 1, SP = 1 } },
  ["Cultist - Dreadnought"] = { role = "tank", weights = { ARMOR = 0.255, ARP = 0.15, AP = 1, BLOCK = 1.8, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.1, PARRY = 0.9, SP = 0.5, STA = 1.12, STR = 2.531, DPS = 14 } },
  ["Witch Hunter - Black Knight"] = { role = "tank", weights = { AGI = 3.326, ARMOR = 0.4, ARP = 0.15, AP = 1, CRIT = 0.35, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.27, PARRY = 0.9, SP = 0.75, STA = 1, STR = 1.225, DPS = 14 } },
  ["Sun Cleric - Blessings"] = { role = "healer", weights = { CRIT = 0.5, HASTE = 0.65, SP = 1, INT = 0.436 } },
  ["Bloodmage - Eternal"] = { role = "tank", weights = { AGI = 2.967, ARMOR = 0.2, ARP = 0.15, AP = 1, CRIT = 0.364, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.067, PARRY = 0.9, SP = 0.25, STA = 1.08, STR = 1.177, DPS = 14 } },
  ["Starcaller - Moon Guard"] = { role = "tank", weights = { AGI = 2.147, ARMOR = 0.2, ARP = 0.15, AP = 0.75, BLOCK = 0.75, CRIT = 0.354, DEF = 1.05, DODGE = 0.9, EXP = 0.5, HASTE = 0.35, HIT = 0.5, INT = 0.721, PARRY = 0.9, SP = 1, STA = 1.1, STR = 2.041, DPS = 14 } },
  ["Venomancer - Vizier"] = { role = "healer", weights = { CRIT = 0.5, HASTE = 0.65, SP = 1, INT = 0.4 } },
}

-- Historical BisBeard numeric weights, cross-referenced with Sidekick roles.
-- Sidekick tier ratings are NOT numeric stat weights.
local function ResearchState()
    if not RefactorGearDB then return nil end
    RefactorGearDB.charResearchVerdicts = RefactorGearDB.charResearchVerdicts or {}
    local key = C.CharKey()
    local state = RefactorGearDB.charResearchVerdicts[key]
    if not state then
        state = {primary={source="original"}, secondary={source="original"}}
        RefactorGearDB.charResearchVerdicts[key] = state
    end
    state.primary = state.primary or {source="original"}
    state.secondary = state.secondary or {source="original"}
    return state
end
local function Active(which)
    local state = ResearchState()
    return state and state[which] and state[which].source == "research" or false
end
local function Names()
    local names = {}
    for name in pairs(C.ResearchWeights) do names[#names+1] = name end
    table.sort(names)
    return names
end
local function Name(which)
    local state = ResearchState()
    return state and state[which] and state[which].profile
end
local function Profile(which)
    if not Active(which) then return nil end
    local selected = Name(which)
    local record = selected and C.ResearchWeights[selected]
    if not record then return nil end
    -- Stable profile identity is vital: equipped-score caches distinguish
    -- primary and secondary research weight sets by this table reference.
    if not record.profile then
        record.profile = {weights=record.weights, customWeights={}}
    end
    return record.profile
end
local function Invalidate()
    -- Changing weights does NOT change the item tooltip scan. RefreshOpenBags
    -- advances the score memo generation and redraws visible arrows without
    -- wiping the expensive raw tooltip cache or rescanning every item.
    if C.RefreshOpenBags then C.RefreshOpenBags() end
    if C.RefreshConfig then C.RefreshConfig() end
end
local function SetSource(which, source)
    if which ~= "primary" and which ~= "secondary" then return end
    if source ~= "original" and source ~= "research" then return end
    local state = ResearchState()
    if not state then return end
    if source == "research" and not state[which].profile then
        local preferred = which == "primary" and RefactorGearDB.activeProfile
            or (RefactorGearDB.charSecondaryProfile and RefactorGearDB.charSecondaryProfile[C.CharKey()])
        if preferred and C.ResearchWeights[preferred] then
            state[which].profile = preferred
        else
            -- Never silently assign another class's weights. When there is
            -- no matching original profile, require an explicit spec pick.
            local className = UnitClass and UnitClass("player")
            local prefix = className and (className .. " - ")
            if prefix then
                for _, candidate in ipairs(Names()) do
                    if candidate:sub(1, #prefix) == prefix then
                        state[which].profile = candidate
                        break
                    end
                end
            end
        end
    end
    state[which].source = source
    Invalidate()
end
local function SetProfile(which, name)
    if which ~= "primary" and which ~= "secondary" then return end
    if name ~= nil and not C.ResearchWeights[name] then return end
    local state = ResearchState()
    if not state then return end
    state[which].profile = name
    Invalidate()
end
C.ResearchSourceActive = Active
C.GetResearchVerdictProfile = Profile
C.GetResearchVerdictName = Name
C.GetResearchVerdictSource = function(which) return Active(which) and "research" or "original" end
C.SetResearchVerdictSource = SetSource
C.SetResearchVerdictProfile = SetProfile
C.GetResearchVerdictNames = Names
