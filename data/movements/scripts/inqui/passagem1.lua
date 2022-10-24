function onStepIn(cid, item, pos)
		local final = {x = 33196, y = 31502, z = 13} -- crystal caves        
		
		if isPlayer(cid) then
			if item.actionid == 14502 then
                    if getPlayerStorageValue(cid, 14501) == 1 then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You dont have acess.")
					end
			end
		end	
	return TRUE
end