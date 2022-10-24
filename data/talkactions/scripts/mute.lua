function onSay(player, words, param)
    local storage = 1500
    local mutetime = 5
    local reason = 'No reason'
    if not player:getGroup():getAccess() then
        return true
    end
    if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
        return false
    end
    if not getPlayerFlagValue(player, PlayerFlag_CanBroadcast) then
        return true
    end
    local split = param:split(",")
    local target = Player(split[1])
    if target == nil then
        player:sendCancelMessage("A player with that name is not online.")
        return false
    end
    if split[2] ~= nil then
        mutetime = split[2]
        if split[3] ~= nil then
            reason = split[3]
        end
    end
    local msg = target:getName()..' has been muted for '..mutetime..' minutes.  Reason:'..reason..'.'
    print("> " .. player:getName() .. " broadcasted: \"" .. msg .. "\".")
    for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, msg, TALKTYPE_BROADCAST)
    end
    target:setStorageValue(storage,os.time()+mutetime*60*1000)
    return false
end