-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Bashe
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 273)
end

return entity
