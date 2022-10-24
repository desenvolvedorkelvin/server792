local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 3000, -50)

local area = createCombatArea(AREA_CROSS5X5)
combat:setArea( area)
combat:setCondition(condition)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 6) + 50)
	max = -((level / 5) + (maglevel * 10) + 75)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
