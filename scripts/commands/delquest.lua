-----------------------------------
-- func: delquest <logID> <questID> <player>
-- desc: Deletes the given quest from the GM or target player.
-----------------------------------
require('scripts/globals/quests')
local logIdHelpers = require('scripts/globals/log_ids')
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = 'sss'
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!delquest <logID> <questID> (player)')
end

function onTrigger(player, logId, questId, target)
    -- validate logId
    local questLog = logIdHelpers.getQuestLogInfo(logId)
    if questLog == nil then
        error(player, 'Invalid logID.')
        return
    end

    local logName = questLog.full_name
    logId = questLog.quest_log

    -- validate questId
    local areaQuestIds = xi.quest.id[xi.quest.area[logId]]
    if questId ~= nil then
        questId = tonumber(questId) or areaQuestIds[string.upper(questId)]
    end

    if questId == nil or questId < 0 then
        error(player, 'Invalid questID.')
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- add quest
    targ:delQuest(logId, questId)
    player:PrintToPlayer(string.format('Deleted %s quest %i from %s.', logName, questId, targ:getName()))
end
