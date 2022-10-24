local rate = 10 --- porcentagem que irá ganhar a mais.

function onKill(cid, target, lastHit)
	
	if isPremium(cid) then
		local monster = Monster(target)
		if not monster then
			return true
		end

		for id, damage in pairs(monster:getDamageMap()) do
			local player = Player(id)
			if player then

				local experience = damage.total / monster:getType():getHealth() * monster:getType():getExperience() 
				local expFormula = (((experience * Game.getExperienceStage(player:getLevel())) / 100) * rate)
				player:addExperience(math.floor(expFormula), true)
			end
		end
	end

	return true
end