function onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:isVip() then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja e Vip!.")
else
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao possui Vip!.")
end
return true
end