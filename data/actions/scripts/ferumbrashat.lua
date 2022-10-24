function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

    if player:hasOutfit(130 or 138,3) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy have both addons.')
		player:say ("You alredy have both addons.", TALKTYPE_ORANGE_1)
        return true
    end
    
    if player:getStorageValue(14902) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy used it.')
		player:say ("You alredy used it.", TALKTYPE_ORANGE_1)
        return true
    end

    if player:getStorageValue(14902) == -1 then
        player:setStorageValue(14902, 1)
        player:addOutfitAddon(138, 2)
		player:addOutfitAddon(130, 2)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received seccond mage addon!')
		player:say ("You have received first mage addon!", TALKTYPE_ORANGE_1)
        item:remove(1)
        end
    return true
    end