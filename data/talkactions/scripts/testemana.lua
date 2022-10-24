function onSay(player, words, param, fromPosition, toPosition)
    if(isPlayer(cid) == true) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ".. getCreatureMana(cid) .." mana points.")
        end
    end
    return true
end