local function doPlayerAddPremiumPoints(cid, count)
   db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
   local player = Player(cid)
   doPlayerAddPremiumPoints(cid, 1)
   player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have recived 1 shop points to your account.")
   player:getPosition():sendMagicEffect(28)
   item:remove(1)
   return true
end