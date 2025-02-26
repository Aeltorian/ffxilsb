-----------------------------------
-- func: setweather
-- desc: Sets the current weather for the current zone.
-----------------------------------
cmdprops =
{
    permission = 1,
    parameters = 's'
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!setweather <weather ID>')
end

function onTrigger(player, weather)
    -- validate weather
    if weather == nil then
        error(player, 'You must supply a weather ID.')
        return
    end

    weather = tonumber(weather) or xi.weather[string.upper(weather)]
    if weather == nil or weather < 0 or weather > 19 then
        error(player, 'Invalid weather ID.')
        return
    end

    -- invert weather table
    local weatherByNum = {}
    for k, v in pairs(xi.weather) do
        weatherByNum[v] = k
    end

    -- set weather
    player:setWeather(weather)
    player:PrintToPlayer(string.format('Set weather to %s.', weatherByNum[weather]))
end
