local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Travel
local function addTravelKeyword(keyword, text, cost, destination, condition)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text, cost = cost, discount = 'postman'}, condition)
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})

	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('peg leg', 'Ohhhh. So... <lowers his voice> \'you know who\' sent you so I sail you to \'you know where\'. <wink> <wink> It will cost |TRAVELCOST| to cover my expenses. Is it that what you wish?', 50, Position(32348, 32625, 7))
addTravelKeyword('treasure island', 'Do you seek a passage to Treasure Island for |TRAVELCOST|?', 150, Position(32024, 32813, 7))     
addTravelKeyword('demonica', 'Do you seek a passage to Demonica for |TRAVELCOST|?', 150, Position(32085, 32688, 7))   
addTravelKeyword('pirate hideout', 'Do you seek a passage to Pirate Hideout for |TRAVELCOST|?', 150, Position(32443, 32579, 7))    
addTravelKeyword('liberty bay', 'Do you seek a passage to Liberty Bay for |TRAVELCOST|?', 150, Position(32348, 32856, 7))      

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Treasure Island or peg leg?'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})

npcHandler:setMessage(MESSAGE_GREET, "Greetings, daring adventurer. If you need a passage to {Peg Leg, Treasure Island, Demonica and Pirate Hideout} let me know.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh well.")
npcHandler:addModule(FocusModule:new())
