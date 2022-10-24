function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid,14502,1)
	doPlayerSendTextMessage(cid, 22, "You receive acess The Blood Hall.")
   return true
end