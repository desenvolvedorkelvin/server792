function onSay(player, words, param)
    if not player:getGroup():getAccess() then
      return true
    end
    local lookMount = tonumber(param)
    if lookMount then
        local playerOutfit = player:getOutfit()
        playerOutfit.lookMount = lookMount
        player:setOutfit(playerOutfit)
    end
    return false
end