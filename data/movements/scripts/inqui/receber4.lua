function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid,14504,1)
	doPlayerSendTextMessage(cid, 22, "You receive acess The Arcanum.")
   return true
end