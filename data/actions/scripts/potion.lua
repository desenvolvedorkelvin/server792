local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_TICKS, getConfigInfo('timeBetweenExActions') + 0) -- Here you can put your exhaust as you want. ( 1000 means = 1 second )

function onUse(cid, item, fromPosition, itemEx, toPosition)
	 if cid:getCondition(CONDITION_EXHAUST) then
       cid:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
       return true
    end			
	if(getPlayerFreeCap(cid) < 180) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need at least 180.00 oz to buy 100x of mana fluids.")
		doAddCondition(cid, exhaust)
		return true
	end

			if getPlayerMoney(cid) >= 10000 then
            doPlayerAddItem(cid, 23373, 100)
			doPlayerRemoveMoney(cid, 10000)
			doAddCondition(cid, exhaust)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have bought a 100x manafluids for " .. 10000 .." gold coins.")
            else
			doAddCondition(cid, exhaust)
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need " .. 10000 .." gps to buy a 100x mana fluids.")
  end

	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)
	elseif item.itemid == 1946 then
		doTransformItem(item.uid, 1945)
	end					 
	return true
end