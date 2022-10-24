local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "present") then
		if player:getStorageValue(2009) == 2 then
			npcHandler:say("You have a present for me?? Realy?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "key") then
		npcHandler:say("Do you want to buy the quest mad key for 1000 gold?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(2331, 1) then
				npcHandler:say("Thank you very much!", cid)
				player:setStorageValue(2009, 3)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:removeMoney(1000) then
				npcHandler:say("Here it is.", cid)
				local key = player:addItem(2087, 1)
				if key then
					key:setActionId(3666)
				end
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Hello, traveller |PLAYERNAME|. How can I help you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())