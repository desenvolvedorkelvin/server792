function onUse(cid, item, fromPosition)


    if getPlayerStorageValue(cid, 31161) >= 1 then 
    doTeleportThing(cid,{x = 32815, y = 32244, z = 12})
	doSendMagicEffect(getPlayerPosition(cid), 10)
    else
    doPlayerSendCancel(cid,"Texto.")
    end
return TRUE
end 

