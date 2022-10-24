function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid,14503,1)
	doPlayerSendTextMessage(cid, 22, "You receive acess The Vats.")
   return true
end