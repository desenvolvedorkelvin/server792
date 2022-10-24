
setPlayerStorageValue(cid,14520,1)

function onUse(cid, item, frompos, item2, topos)
if item.actionid == 14521 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8023,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14522 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8026,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14523 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8090,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14524 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8102,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14525 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8096,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14526 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8100,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14527 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8060,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14528 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8053,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.actionid == 14529 then
queststatus = getPlayerStorageValue(cid,14520)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a item.")
doPlayerAddItem(cid,8062,1)
setPlayerStorageValue(cid,14520,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end