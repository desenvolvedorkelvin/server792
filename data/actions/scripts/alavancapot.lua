local exaust = 2 -- 3 segundos
local storage = 14730 -- alguma storage que não esteja em uso

function onUse(player, item, fromPosition, itemEx, toPosition)
	local Config = {
			[14730] = {itemid = 23373, quant = 100, cost = 5000}
	}
	if exhaustion.get(player, storage) then
		if doPlayerRemoveMoney(cid, Config[item.actionid].cost) then
				doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a ".. getItemNameById(Config[item.actionid].itemid) .."s for ".. Config[item.actionid].cost .." gold.")
				doPlayerAddItem(cid, Config[item.actionid].itemid, Config[item.actionid].quant)
				exhaustion.set(cid, storage, exaust)
		else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. Config[item.actionid].cost .." gold coins to buy a ".. Config[item.actionid].itemid .."s.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You are exhausted.")
	end
end