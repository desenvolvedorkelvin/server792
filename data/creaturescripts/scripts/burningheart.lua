local itemid = 2353 --id do item pra ganhar
local itemcount = 1 --qtd do item
local lvlmin = 80 -- lvl min do player que morreu pra ganha item

function onKill(cid, target, lastHit)
  if ((isPlayer(target)) and (getPlayerLevel(target) >= lvlmin)) then
    item = doPlayerAddItem(cid, 2353, 1)
		doSetItemSpecialDescription(item,"This is the heart of "..getPlayerName(target).." killed at Level "..getPlayerLevel(target).." by "..getPlayerName(cid)..".")
		doSendMagicEffect(getCreaturePosition(cid),12)
  end
  return true
end

