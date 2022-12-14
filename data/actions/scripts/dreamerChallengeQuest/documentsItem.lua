local config = {
	[7844] = {
		[1] = {female = 269, male = 268, msg = 'nightmare'},
		[2] = {female = 279, male = 278, msg = 'brotherhood'}
	},
	[7845] = {
		[1] = {female = 269, male = 268, addon = 1, msg = 'first nightmare'},
		[2] = {female = 279, male = 278, addon = 1, msg = 'first brotherhood'},
		storageValue = 2
	},
	[7846] = {
		[1] = {female = 269, male = 268, addon = 2, msg = 'second nightmare'},
		[2] = {female = 279, male = 278, addon = 2, msg = 'second brotherhood'},
		storageValue = 3
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	local choice = useItem[1]
	if player:getStorageValue(1064) > player:getStorageValue(1065) then
		choice = useItem[2]
	end

	if choice.addon then
		if player:hasOutfit(player:getSex() == 0 and choice.female or choice.male) then
			if not player:hasOutfit(player:getSex() == 0 and choice.female or choice.male, choice.addon) then
				if player:getStorageValue(1065) >= useItem.storageValue or player:getStorageValue(1064) >= useItem.storageValue then
					player:addOutfitAddon(choice.female, choice.addon)
					player:addOutfitAddon(choice.male, choice.addon)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. choice.msg .. ' addon!')
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
					item:remove(1)
				else
					return false
				end
			else
				player:sendCancelMessage('You have already obtained this addon!')
			end
		else
			return false
		end
	else
		if not player:hasOutfit(player:getSex() == 0 and choice.female or choice.male) then
			if player:getStorageValue(1065) >= 1 or player:getStorageValue(1064) >= 1 then
				player:addOutfit(choice.female)
				player:addOutfit(choice.male)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. choice.msg .. ' outfit!')
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				item:remove(1)
			else
				return false
			end
		else
			player:sendCancelMessage('You have already obtained this outfit!')
		end
	end
	return true
end