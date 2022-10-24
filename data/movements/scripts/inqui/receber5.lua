
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid,14505,1)
	doPlayerSendTextMessage(cid, 22, "You receive acess The Hive.")
   return true
end