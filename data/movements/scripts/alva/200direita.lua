function onStepIn(cid, item, pos)
		local heart = 2353
		local final = {x = 33324, y = 32051, z = 8} -- 20206        

		if isPlayer(cid) then
			if item.actionid == 11000 then
					if doPlayerRemoveItem(cid, 2353, 10) then
					doTeleportThing(cid, final) 
					doPlayerSendTextMessage(cid, 22, "Welcome!")
					else
					doPlayerSendTextMessage(cid, 22, "You need sacrifice 10 hearts.")
					end
			end
		end	
	return TRUE
end