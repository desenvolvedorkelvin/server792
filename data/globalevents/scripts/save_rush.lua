local config = {
	broadcast = {120, 30},
	flags = 13,
	delay = 120,
	events = 30
}

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		doBroadcastMessage("Server save within " .. seconds .. " seconds, please mind it may freeze!")
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.flags)
	end
end
function delayedSave(cid)
	if isPlayer(cid) then
		return doPlayerSave(cid)
	end
end

function onThink(interval)
	--[[if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.flags)
	else
		executeSave(config.delay)
	end--]]
	
	local playersToSave = {} 
	for _, cid in pairs(getOnlinePlayers()) do        
		if isPlayer(cid) then
			table.insert(playersToSave, {cid, getPlayerLevel(cid)})
		end
	end

	table.sort(playersToSave, function(a,b) return a[2] > b[2] end)
	for i=1, #playersToSave do
		local tmpCid = playersToSave[i][1]
		addEvent(delayedSave, i * 50, tmpCid)
	end
	return true
end
