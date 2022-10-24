function onStepIn(cid, item, pos)
		local final = {x = 33494, y = 31397, z = 15} -- bloodwalls dark torture
		
		if isPlayer(cid) then
			if item.actionid == 14504 then
                    if getPlayerStorageValue(cid, 14502) == 1 then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You dont have acess.")
					end
			end
		end	
	return TRUE
end