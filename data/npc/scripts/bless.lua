local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end
local voices = {
 {text = 'ANOTHER RABBIT, HMPF. OR IS IT A FOX? A BAT?! STAY OUT!'} ,
 {text = 'Come, take a seat! Or... oh, I see. Feel free to just stand there'}
 
 
 }

npcHandler:addModule(VoiceModule:new(voices))


local function creatureSayCallback(cid, type, msg)

    if not npcHandler:isFocused(cid) then
        return false
    end
    local player = Player(cid)
    local totalBlessPrice = getBlessingsCost(player:getLevel()) * 12 * 0.5	
 
     if msgcontains(msg, "yes") or msgcontains(msg, "bless")  then
	 if player:getBlessings() == 4 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have been blessed!", cid)
	 elseif player:removeMoney(totalBlessPrice) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been blessed by all of eight gods!")
		for b = 1, 4 do
			if not player:hasBlessing(b) then
				player:addBlessing(b, 1)
			end
		end
		player:setStorageValue(999563, 1)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough money. You need " .. totalBlessPrice .. " to buy bless.", cid)
	end
	
	return false
end

end

keywordHandler:addKeyword({'thaian'}, StdModule.say, {npcHandler = npcHandler, text = 'So you found non. No crystals, none at all. Go in to the dungeon and try to farm more luminescent crystals.'})
keywordHandler:addKeyword({'need'}, StdModule.say, {npcHandler = npcHandler, text = 'Nrgaaaah! Get back if you have enough info from {Spectulus}...'})
keywordHandler:addKeyword({'report'}, StdModule.say, {npcHandler = npcHandler, text = 'You have to find the way how to acces to the dungeon first.'})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'You have to find the way how to acces to the dungeon first.'})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
	
	
	
