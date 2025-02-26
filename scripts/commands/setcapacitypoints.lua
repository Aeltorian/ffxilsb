---------------------------------------------------------------------------------------------------
-- func: setcapacitypoints <amount> <player>
-- desc: Sets the target players job points count.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = 'is'
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!setcapacitypoints <amount> (player)')
end

function onTrigger(player, amount, target)
    -- validate amount
    if amount == nil or amount < 0 then
        error(player, 'Invalid amount.')
        return
    elseif amount > 29999 then
        amount = 29999
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

    local jobNameByNum = {}
    for k, v in pairs(xi.job) do
        jobNameByNum[v] = k
    end

    -- set capacity points
    targ:setCapacityPoints(amount)
    player:PrintToPlayer(string.format('%s now has %i capacity points on %s.', targ:getName(), amount, jobNameByNum[targ:getMainJob()]))
end
