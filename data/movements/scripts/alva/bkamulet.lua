function onStepIn(cid, item, pos)
		local heart = 2353
		local final = {x = 33264, y = 32065, z = 8} -- 20206

		if isPlayer(cid) then
			if item.actionid == 20167 then
					if doPlayerRemoveItem(cid, 2353, 3) then
					doTeleportThing(cid, final) 
					doPlayerSendTextMessage(cid, 22, "Welcome!")
					else
					doPlayerSendTextMessage(cid, 22, "You need sacrifice 3 hearts.")
					end
			end
		end	
	return TRUE
end