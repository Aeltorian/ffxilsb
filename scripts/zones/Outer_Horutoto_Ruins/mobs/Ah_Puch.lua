-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--   NM: Ah Puch
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 291)
end

return entity
