function onStepIn(cid, item, pos)
		local final = {x = 33168, y = 31461, z = 15} -- spectrum warlocks
		
		if isPlayer(cid) then
			if item.actionid == 14508 then
                    if getPlayerStorageValue(cid, 14504) == 1 then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You dont have acess.")
					end
			end
		end	
	return TRUE
end