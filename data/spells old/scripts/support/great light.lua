local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_LIGHT)
condition:setParameter(CONDITION_PARAM_LIGHT_LEVEL, 8)
condition:setParameter(CONDITION_PARAM_LIGHT_COLOR, 215)
condition:setParameter(CONDITION_PARAM_TICKS, (11*60+35)*1000)
combat:setCondition(condition)

local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
