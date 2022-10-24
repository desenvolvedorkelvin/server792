function onStepIn(cid, item, pos)
		local final = {x = 33280, y = 31502, z = 12} -- vats
		
		if isPlayer(cid) then
			if item.actionid == 14506 then
                    if getPlayerStorageValue(cid, 14503) == 1 then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You dont have acess.")
					end
			end
		end	
	return TRUE
end