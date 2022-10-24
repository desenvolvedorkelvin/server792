function onStepIn(cid, item, pos)
		local final = {x = 33326, y = 31407, z = 12} -- the hive
		
		if isPlayer(cid) then
			if item.actionid == 14510 then
                    if getPlayerStorageValue(cid, 14505) == 1 then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You dont have acess.")
					end
			end
		end	
	return TRUE
end