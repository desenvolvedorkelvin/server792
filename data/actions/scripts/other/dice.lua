function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local position = item:getPosition()
	local value = math.random(1, 6)
	local isInGhostMode = player:isInGhostMode()

	position:sendMagicEffect(CONST_ME_CRAPS, isInGhostMode and player)

	local spectators = Game.getSpectators(position, false, true, 3, 3)
	for i = 1, #spectators do
		player:say(player:getName() .. " rolled a " .. value .. ".", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], position)
	end

	item:transform(5791 + value)
	return true
end
