function onSay(player, words, param)
	local text = '---------------------------**| -> Tasks System Infos <- |**---------------------------\n'

	if param:lower() == "me" then
		text = text .. '[+] Task Points [+]: You have '..taskPoints_get(player)..' task points.\n[+] Task Rank Points [+]: Você tem '..taskRank_get(player)..' rank points.\n[+] Rank Task [+]: '..getRankTask(player)..''
		return false,  player:popupFYI(text)
	end

	local ret_t = getTaskInfos(player)
	if ret_t then
		text = text .. '\n\n      [ -> ----- [+]  Tasks [+] ----- <- ]\n      \n[*] Current Task [*]: '..ret_t.name..' - You need to kill: '..ret_t.amount..'.\n[*] Awards [*]: '..getItemsFromTable(ret_t.items)..' - '..ret_t.pointsTask[1]..' Task Points - '..ret_t.pointsTask[2]..' Task Ranks. \n[*] Progress [*]: ['..(player:getStorageValue(ret_t.storage))..'/'..ret_t.amount..']\n[*] Task Status [*]: '..(player:getStorageValue(ret_t.storage) == ret_t.amount and 'Complete' or 'Incomplete')..'!'			
	else
		text = text .. "\n\n      [ -> ----- [+]  Tasks [+] ----- <- ]\n      \n--- You aren't doing any Task."
	end



	return false,  player:popupFYI(text)
end