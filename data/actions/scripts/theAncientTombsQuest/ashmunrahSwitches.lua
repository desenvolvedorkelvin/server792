local function resetScript(position)
	Tile(position):getItemById(1946):transform(1945)
	Game.setStorageValue(112, Game.getStorageValue(112) - 1)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return false
	end

	Game.setStorageValue(112, Game.getStorageValue(112) + 1)
	item:transform(1946)
	addEvent(resetScript, 2 * 60 * 1000, toPosition)
	return true
end