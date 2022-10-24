local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 60000)

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:setParameter(CONDITION_PARAM_MINVALUE, -50)
poison:setParameter(CONDITION_PARAM_MAXVALUE, -120)
poison:setParameter(CONDITION_PARAM_STARTVALUE, -5)
poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)
poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local fluidMessage = {
	[3] = "Aaaah...",
	[4] = "Aaaah...",
	[5] = "Aaaah...",
	[7] = "Aaaah...",
	[10] = "Aaaah...",
	[11] = "Aaaah...",
	[13] = "Aaaah...",
	[15] = "Aaaah...",
	[19] = "Aaaah..."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
           
			player:addMana(math.random(50, 150))
			player:say(fluidMessage[item.type] or "Aaaah...", TALKTYPE_ORANGE_1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            item:remove(1)

	return true
end