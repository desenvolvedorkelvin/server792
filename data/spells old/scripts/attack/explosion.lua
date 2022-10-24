local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local area = createCombatArea(AREA_CROSS1X1)
combat:setArea( area)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 1.6) + 9)
	max = -((level / 5) + (maglevel * 3.2) + 19)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
