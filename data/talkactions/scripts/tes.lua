function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	player:removeItem(2160, 1)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Item removido!")
end