local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 1.4) + 8)
	max = -((level / 5) + (maglevel * 2.2) + 14)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
