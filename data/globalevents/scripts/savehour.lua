local config = {
	broadcast = {120, 30},
	flags = 13,
	delay = 30,
	events = 30
}

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		broadcastMessage("Server houses within " .. seconds .. " seconds, please mind it may freeze!")
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		saveData(config.flags)
	end
end

function onThink(interval)
	if(table.maxn(config.broadcast) == 0) then
		saveData(config.flags)
	else
		executeSave(config.delay)
	end

	return true
end