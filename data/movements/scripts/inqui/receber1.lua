function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid,14501,1)
	doPlayerSendTextMessage(cid, 22, "You receive acess cystal caves.")
   return true
end