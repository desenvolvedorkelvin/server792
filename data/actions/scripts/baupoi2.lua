local stor = getPlayerStorageValue(cid, 101)

function onUse(cid, item, frompos, item2, topos)
	if item.uid == 14704 then
queststatus = getPlayerStorageValue(cid,101)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
doPlayerAddItem(cid,2494,1)
setPlayerStorageValue(cid,101,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 14705 then
queststatus = getPlayerStorageValue(cid,101)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
doPlayerAddItem(cid,2400,1)
setPlayerStorageValue(cid,101,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 14706 then
queststatus = getPlayerStorageValue(cid,101)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
doPlayerAddItem(cid,2431,1)
setPlayerStorageValue(cid,101,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 14707 then
queststatus = getPlayerStorageValue(cid,101)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
doPlayerAddItem(cid,2421,1)
setPlayerStorageValue(cid,101,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end