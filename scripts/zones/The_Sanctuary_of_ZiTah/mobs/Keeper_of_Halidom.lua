-----------------------------------
-- Area: The Sanctuary of ZiTah
--   NM: Keeper of Halidom
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 324)
end

return entity
