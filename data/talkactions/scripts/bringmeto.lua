function onSay(player, words, param)
	if (param == 'me to thais') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to carlin') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to venore') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to ab dendriel') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to edron') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to darashia') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to ankrahmun') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to darashia') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to svargrond') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to port hope') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to liberty bay') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to goroma') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to peg leg') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to cormaya') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to eremo') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to kazordoon') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to folda') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to senja') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to okolnir') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to camp') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if (param == 'me to nibelor') and not player:isPzLocked(cid) then
	
		
		return true
	end
	if(param == '') or (param == 'info') then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Use website for more info!")
		return true
	end
	local split = param:split(",")
	if split[2] == nil then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "you cannot use 'bring me' if you have pz.")
		return false
end
	return true
end