
function onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return true
    end

    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end
    saveData()
    doPlayerSendTextMessage(cid, 24, "Server saved.")
    return false
end