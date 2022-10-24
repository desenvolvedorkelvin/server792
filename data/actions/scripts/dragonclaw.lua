function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

    if player:hasOutfit(134 or 142,3) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy have both addons.')
		player:say ("You alredy have both addons.", TALKTYPE_ORANGE_1)
        return true
    end
    
    if player:getStorageValue(14905) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy used it.')
		player:say ("You alredy used it.", TALKTYPE_ORANGE_1)
        return true
    end

    if player:getStorageValue(14905) == -1 then
        player:setStorageValue(14905, 1)
        player:addOutfitAddon(134, 1)
		player:addOutfitAddon(142, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received first warrior addon!')
		player:say ("You have received first warrior addon!", TALKTYPE_ORANGE_1)
        item:remove(1)
        end
    return true
    end