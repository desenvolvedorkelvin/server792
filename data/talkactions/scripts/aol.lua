 function onSay(cid, words, param)

 
if doPlayerRemoveMoney(cid, 1000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
else
doCreatureSay(cid, "dont have money!", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end