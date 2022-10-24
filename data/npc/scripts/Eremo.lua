local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Welcome my garden!'} }
npcHandler:addModule(VoiceModule:new(voices))


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'amulet of loss'}, 					Cfamuletofloss, 20000)
shopModule:addBuyableItem({'protection amulet'}, 					Cfprotectionamulet, 700, 250)
shopModule:addBuyableItem({'broken amulet', 'amulet of life'}, 					Cfbrokenamulet, 50000)

-- Travel
local function addTravelKeyword(keyword, cost, destination, action)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})

	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('cormaya', 110, Position(33288, 31956, 6), function(player) if player:getStorageValue(2005) == 1 then player:setStorageValue(2005, 2) end end)
addTravelKeyword('back', 130, Position(33288, 31956, 6))
addTravelKeyword('edron', 130, Position(33288, 31956, 6))


-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(33288, 31956, 6), Position(32321, 32210, 6)}})
	

npcHandler:setMessage(MESSAGE_GREET, 'Welcome to my little garden, adventurer |PLAYERNAME|.! Where can I sail you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Welcome to my little garden.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())
