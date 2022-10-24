function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) and not getTilePzInfo(player:getPosition()) then
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need remove Battle.")	
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end

if table.contains({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
	player:setSkull(SKULL_NONE)
	player:setSkullTime(0)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skull has been removed!")
	item:remove(1)
else
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only remove red skull!")
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
end
return true
end