local C = RefactorGearInternal
local Print = C.Print
local CompareItem = C.CompareItem
local SetArrowAtlas = C.SetArrowAtlas
local SetArrowLocked = C.SetArrowLocked
local SEC_R, SEC_G, SEC_B = C.SEC_R, C.SEC_G, C.SEC_B
local verdictCache = C.verdictCache

--------------------------------------------------------------------------
-- Bag slot upgrade arrow
--------------------------------------------------------------------------

-- Same shipped arrow texture as the tooltip overlay, tinted green. (A
-- font glyph was tried first but FRIZQT__.TTF has no ▲ in this client;
-- stock arrow textures proved unreliable too — the red variant is
-- missing from this build.) If the file somehow fails to load, fall
-- back to a plain green marker so something still shows.
-- Black backing copy of the arrow, 2px larger and centred behind it, so the
-- shape keeps a dark rim on every side. Green/blue arrows over a green item
-- icon were near-invisible without it. Must be created BEFORE the arrow it
-- backs. It goes on ARTWORK, one layer BELOW the OVERLAY arrow — same-layer
-- creation order is not a reliable z-order on this client (the shadow drew
-- over the arrow and blacked it out). ARTWORK is still above the item
-- button's BACKGROUND icon, so the rim shows against the icon art.
local function MakeArrowShadow(button, atlasName, point, x, y)
    local shadow = button:CreateTexture(nil, "ARTWORK")
    shadow:SetWidth(18)
    shadow:SetHeight(20)
    shadow:SetPoint(point, button, point, x, y)
    SetArrowAtlas(shadow, atlasName, 0, 0, 0)
    shadow:SetVertexColor(0, 0, 0, 0.85)
    shadow:Hide()
    return shadow
end

local function GetBagArrow(button)
    local arrow = button.refactorArrow
    if not arrow then
        button.refactorArrowShadow = MakeArrowShadow(button, "loottoast-arrow-green", "TOPRIGHT", 1, 1)
        arrow = button:CreateTexture(nil, "OVERLAY")
        arrow:SetWidth(14)
        arrow:SetHeight(16)
        arrow:SetPoint("TOPRIGHT", button, "TOPRIGHT", -1, -1)
        SetArrowAtlas(arrow, "loottoast-arrow-green", 0, 1, 0)
        button.refactorArrow = arrow
    end
    return arrow
end

-- Secondary profile's bag arrow: loottoast-arrow-blue texture, opposite corner. Only
-- ever an UPGRADE marker (upgrades/empty slots) — downgrades get no arrow
-- for either profile.
local function GetBagArrow2(button)
    local arrow = button.refactorArrow2
    if not arrow then
        button.refactorArrow2Shadow = MakeArrowShadow(button, "loottoast-arrow-blue", "TOPLEFT", -1, 1)
        arrow = button:CreateTexture(nil, "OVERLAY")
        arrow:SetWidth(14)
        arrow:SetHeight(16)
        arrow:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
        SetArrowAtlas(arrow, "loottoast-arrow-blue", SEC_R, SEC_G, SEC_B)
        button.refactorArrow2 = arrow
    end
    return arrow
end

local function UpdateArrowForLink(button, link, bag, slot)
    -- `locked` is declared up here with show/show2 on purpose: `result` is
    -- scoped to the branch below, so computing it outside would read a nil
    -- global (the declaration-order/scope hazard this file has been bitten by).
    local show, show2, locked = false, false, false
    if link and RefactorGearDB and RefactorGearDB.enabled and RefactorGearDB.bagIcons then
        local result = CompareItem(link, bag, slot)
        -- The arrow is a promise, not a hint: estimates (base-item link
        -- scans, cached other-character slots) never earn it — and the
        -- secondary (blue) arrow plays by the exact same rule.
        show = result ~= nil
            and not result.approx
            and (result.status == "upgrade" or result.status == "empty")
        local sec = result and result.secondary
        show2 = RefactorGearDB.secondaryBagArrow
            and sec ~= nil
            and not result.approx
            and (sec.status == "upgrade" or sec.status == "empty")
        -- Both verdicts describe the SAME item, so one lock flag drives both
        -- arrows. Orange replaces green and blue alike (see LOCK_* in
        -- 05_tooltip): the corner already says which profile an arrow is.
        locked = (show or show2) and result.levelLocked or false
    end
    if show then
        -- GetBagArrow creates the shadow first, so it exists by the time the
        -- shadow branch below runs.
        local arrow = GetBagArrow(button)
        SetArrowLocked(arrow, locked, "loottoast-arrow-green", 0, 1, 0)
        arrow:Show()
        if button.refactorArrowShadow then
            -- The shadow is a second copy of the same sprite; leaving it green
            -- behind an orange arrow shows a green rim on every side.
            SetArrowLocked(button.refactorArrowShadow, locked,
                "loottoast-arrow-green", 0, 0, 0, true)
            button.refactorArrowShadow:Show()
        end
    elseif button.refactorArrow then
        button.refactorArrow:Hide()
        if button.refactorArrowShadow then button.refactorArrowShadow:Hide() end
    end
    if show2 then
        local arrow2 = GetBagArrow2(button)
        SetArrowLocked(arrow2, locked, "loottoast-arrow-blue", SEC_R, SEC_G, SEC_B)
        arrow2:Show()
        if button.refactorArrow2Shadow then
            SetArrowLocked(button.refactorArrow2Shadow, locked,
                "loottoast-arrow-blue", 0, 0, 0, true)
            button.refactorArrow2Shadow:Show()
        end
    elseif button.refactorArrow2 then
        button.refactorArrow2:Hide()
        if button.refactorArrow2Shadow then button.refactorArrow2Shadow:Hide() end
    end
end

local function UpdateBagButton(button, bag, slot)
    UpdateArrowForLink(button, GetContainerItemLink(bag, slot), bag, slot)
end

local function UpdateContainerArrows(frame)
    local bag = frame:GetID()
    local frameName = frame:GetName()
    local shown = 0
    for i = 1, frame.size do
        local button = _G[frameName .. "Item" .. i]
        if button then
            UpdateBagButton(button, bag, button:GetID())
            if button.refactorArrow and button.refactorArrow:IsShown() then
                shown = shown + 1
            end
        end
    end
    if RefactorGearDB and RefactorGearDB.debug then
        Print("bag " .. bag .. " updated, " .. shown .. " upgrade arrow(s).")
    end
end

-- 3.3.5 has no per-button update function to hook; ContainerFrame_Update
-- is what redraws a whole bag frame (on open and on BAG_UPDATE while
-- open). Guarded in case this custom client renames it — losing the bag
-- arrows should not take the rest of the addon down with it.
if type(ContainerFrame_Update) == "function" then
    hooksecurefunc("ContainerFrame_Update", UpdateContainerArrows)
end

-- Bagnon replaces the stock bag frames entirely, so ContainerFrame_Update
-- never fires while it's enabled. Its item buttons all share the
-- Bagnon.ItemSlot class; post-hooking its Update method covers every
-- slot redraw. DragonUI's bundled Combuctor bag module is the same
-- design (a KPack Combuctor port, itself Bagnon-family) with the same
-- ItemSlot surface (Update/GetBag/GetID/GetItem/IsCached), exposed as
-- DragonUI.CombuctorItemSlot. Buttons are remembered (weak-keyed, mapped
-- to the updater matching their addon's button surface) so equipment
-- changes can re-evaluate them without waiting for the bag addon's own
-- updates.
local hookedSlotButtons = setmetatable({}, { __mode = "k" })

local function UpdateBagnonSlot(self)
    -- Cached slots show another character's (or offline) data; the
    -- live bag APIs would read the wrong item, so fall back to the
    -- link-only scan for those.
    local bag, slot
    if not self:IsCached() then
        bag, slot = self:GetBag(), self:GetID()
    end
    UpdateArrowForLink(self, self:GetItem(), bag, slot)
end

local function HookItemSlotClass(itemSlot)
    hooksecurefunc(itemSlot, "Update", function(self)
        hookedSlotButtons[self] = UpdateBagnonSlot
        UpdateBagnonSlot(self)
    end)
end

local bagnonHooked = false
local function TryHookBagnon()
    if bagnonHooked then return end
    local ace = LibStub and LibStub.GetLibrary
        and LibStub:GetLibrary("AceAddon-3.0", true)
    local bagnon = ace and ace:GetAddon("Bagnon", true)
    local itemSlot = bagnon and bagnon.ItemSlot
    if not itemSlot or type(itemSlot.Update) ~= "function" then return end
    HookItemSlotClass(itemSlot)
    bagnonHooked = true
end

local dragonUIHooked = false
local function TryHookDragonUI()
    if dragonUIHooked then return end
    local itemSlot = _G.DragonUI and _G.DragonUI.CombuctorItemSlot
    if not itemSlot or type(itemSlot.Update) ~= "function" then return end
    HookItemSlotClass(itemSlot)
    dragonUIHooked = true
end

-- AdiBags replaces the stock bags too, but its buttons aren't
-- Bagnon-family: no GetBag/GetItem/IsCached, just .bag/.slot fields and
-- a per-button Update on the "ItemButton" class prototype (fetched via
-- its OO layer's GetClass). The bank sub-class inherits Update through
-- __index, so one post-hook covers backpack, bags and bank alike.
-- AdiBags has no offline-character cache — visible buttons always show
-- the live player bags, so the container APIs are always the right
-- source (its own cached .itemLink can lag behind on equip-triggered
-- refreshes).
local function UpdateAdiBagsSlot(self)
    local bag, slot = self.bag, self.slot
    if bag == nil or slot == nil then return end
    UpdateArrowForLink(self, GetContainerItemLink(bag, slot), bag, slot)
end

local adiBagsHooked = false
local function TryHookAdiBags()
    if adiBagsHooked then return end
    local ace = LibStub and LibStub.GetLibrary
        and LibStub:GetLibrary("AceAddon-3.0", true)
    local adibags = ace and ace:GetAddon("AdiBags", true)
    local class = adibags and adibags.GetClass
        and adibags:GetClass("ItemButton")
    local proto = class and class.prototype
    if not proto or type(proto.Update) ~= "function" then return end
    hooksecurefunc(proto, "Update", function(self)
        hookedSlotButtons[self] = UpdateAdiBagsSlot
        UpdateAdiBagsSlot(self)
    end)
    adiBagsHooked = true
end

-- ElvUI's bag module replaces the stock frames too, but isn't Bagnon- or
-- AdiBags-family: one shared module method (Bags:UpdateSlot(frame, bagID,
-- slotID)) redraws every slot button, rather than a per-button class.
-- Post-hooking that method covers backpack + bags; the button itself is
-- frame.Bags[bagID][slotID] and carries no bag/slot fields of its own, so
-- they're stashed on the button for RefreshOpenBags to reuse later.
local function UpdateElvUISlot(button, bagID, slotID)
    button.refactorBag, button.refactorSlot = bagID, slotID
    UpdateArrowForLink(button, GetContainerItemLink(bagID, slotID), bagID, slotID)
end

local function RefreshElvUISlot(button)
    if button.refactorBag == nil then return end
    UpdateArrowForLink(button, GetContainerItemLink(button.refactorBag, button.refactorSlot),
        button.refactorBag, button.refactorSlot)
end

local elvUIHooked = false
local function TryHookElvUI()
    if elvUIHooked then return end
    local ace = LibStub and LibStub.GetLibrary
        and LibStub:GetLibrary("AceAddon-3.0", true)
    local elvui = ace and ace.GetAddon and ace:GetAddon("ElvUI", true)
    local bagsModule = elvui and elvui.GetModule and elvui:GetModule("Bags", true)
    if not bagsModule or type(bagsModule.UpdateSlot) ~= "function" then return end
    hooksecurefunc(bagsModule, "UpdateSlot", function(self, frame, bagID, slotID)
        local button = frame and frame.Bags and frame.Bags[bagID] and frame.Bags[bagID][slotID]
        if not button then return end
        hookedSlotButtons[button] = RefreshElvUISlot
        UpdateElvUISlot(button, bagID, slotID)
    end)
    elvUIHooked = true
end

-- Redraws every verdict-driven marker (stock and bag-addon slot buttons,
-- quest reward markers, roll-frame arrows, vendor item buttons) against the current memo
-- state. Invalidation is the caller's job: RefreshOpenBags for
-- verdict-moving state changes, the bag-only flush below for single-bag
-- churn.
local function RedrawBags()
    for i = 1, NUM_CONTAINER_FRAMES do
        local frame = _G["ContainerFrame" .. i]
        if frame and frame:IsShown() then
            UpdateContainerArrows(frame)
        end
    end
    for button, updateSlot in pairs(hookedSlotButtons) do
        if button:IsVisible() then
            updateSlot(button)
        end
    end
    if C.UpdateQuestRewards then C.UpdateQuestRewards() end
    if C.StartRollUpdates then C.StartRollUpdates() end
    if C.UpdateMerchantArrows then C.UpdateMerchantArrows() end
end

-- Re-evaluate arrows on open bags when equipped gear changes (equipping
-- an upgrade makes the remaining bag copies stop being upgrades).
function C.RefreshOpenBags()
    -- Every caller is a state change that moves verdicts globally (equip
    -- events via the debounced flush, weight/profile/filter edits,
    -- level-up) or an explicit "re-evaluate everything": invalidate the
    -- score and verdict memos so this pass — and hovers after it —
    -- recompute fresh. Bag-only changes deliberately do NOT come through
    -- here (the flush takes the cheaper targeted path): they can't move
    -- the equipped scores or other bags' verdicts.
    C.generation = C.generation + 1
    for k in pairs(verdictCache) do verdictCache[k] = nil end
    RedrawBags()
end

C.TryHookBagnon = TryHookBagnon
C.TryHookDragonUI = TryHookDragonUI
C.TryHookAdiBags = TryHookAdiBags
C.TryHookElvUI = TryHookElvUI
C.RedrawBags = RedrawBags
