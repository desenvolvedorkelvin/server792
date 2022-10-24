local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Edron, Thais, Venore, Darashia, Ankrahmun and Port Hope.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, text)

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text or 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('edron', 170, Position(33173,31764, 6))
addTravelKeyword('venore', 180, Position(32954,32022, 6))
addTravelKeyword('port hope', 50, Position(32527,32784, 6))
addTravelKeyword('darashia', 200, Position(33289,32480, 6))
addTravelKeyword('goroma', 500, Position(31994, 32565, 6))
addTravelKeyword('ankrahmun', 90, Position(33092,32883, 6))

-- Thais
local travelKeyword = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Thais for |TRAVELCOST|?', cost = 180, discount = 'postman'})
	local childTravelKeyword = travelKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'I have to warn you - we might get into a tropical storm on that route. I\'m not sure if my ship will withstand it. Do you really want to travel to Thais?'})
		childTravelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = 180, discount = 'postman', destination = function(player) return math.random(8) == 1 and Position(32161, 32558, 6) or Position(32310, 32210, 6) end})
		childTravelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(32275, 32892, 6), Position(32276, 32891, 6), Position(32277, 32895, 6)}})

npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Recommend us if you were satisfied with our service.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:addModule(FocusModule:new())
