local combat = Combat()
combat:setParameter(CONDITION_PARAM_TICKS, 10000)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
combat:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 6.3) + 32)
	max = -((level / 5) + (maglevel * 9.4) + 48)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
