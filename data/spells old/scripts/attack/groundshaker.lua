local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea( area)

function onGetFormulaValues(cid, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, Player(cid):getLevel() / 5
	return -(((skillTotal * 0.02) + 4) + (levelTotal)), -(((skillTotal * 0.03) + 6) + (levelTotal))
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
exhaust:setParameter(CONDITION_PARAM_TICKS, 1000)
combat:setCondition(exhaust)
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
