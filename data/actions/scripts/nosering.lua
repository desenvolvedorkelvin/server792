function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

    if player:hasOutfit(156 or 152,3) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy have both addons.')
		player:say ("You alredy have both addons.", TALKTYPE_ORANGE_1)
        return true
    end
    
    if player:getStorageValue(14904) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You alredy used it.')
		player:say ("You alredy used it.", TALKTYPE_ORANGE_1)
        return true
    end

    if player:getStorageValue(14904) == -1 then
        player:setStorageValue(14904, 1)
        player:addOutfitAddon(156, 2)
		player:addOutfitAddon(152, 2)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received seccond assassin addon!')
		player:say ("You have received seccond assassin addon!", TALKTYPE_ORANGE_1)
        item:remove(1)
        end
    return true
    end