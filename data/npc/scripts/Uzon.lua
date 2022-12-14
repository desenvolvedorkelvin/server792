local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Edron and Darashia.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, action)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})

	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('edron', 40, Position(33193, 31784, 3))
addTravelKeyword('hills', 60, Position(32536, 31837, 4))
addTravelKeyword('femor hills', 60, Position(32536, 31837, 4))
addTravelKeyword('darashia', 60, Position(33270, 32441, 6))



-- Kick

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Captain Bluebear from the Royal Tibia Line.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, text = 'We can transport everything you want.'})
keywordHandler:addKeyword({'passenger'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to welcome you on board.'})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay or Svargrond?'})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, text = 'Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'This is Thais. Where do you want to go?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I sail you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())
