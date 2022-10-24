function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")

	local jogador = Player(split[1])
	if not jogador:isPlayer() then
		player:sendCancelMessage("Player not found.")
		return false
	end

	local dias = tonumber(split[2])
	if dias == nil then
		player:sendCancelMessage("Invalid param specified.")
		return false
	end

	jogador:addVipDays(dias)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Foram adicionados ".. dias .." dias de VIP no character ".. split[1] ..".")

	return false
end