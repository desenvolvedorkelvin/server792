function Creature:onChangeOutfit(outfit)
	if EventCallback.onChangeMount then
		if not EventCallback.onChangeMount(self, outfit.lookMount) then
			return false
		end
	end
	if EventCallback.onChangeOutfit then
		return EventCallback.onChangeOutfit(self, outfit)
	end
	return true
end


function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return true
end

function Creature:onTargetCombat(target)
	return true
end
