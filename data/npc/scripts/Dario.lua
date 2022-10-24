local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the master archer of the arena. I train distance fighters and sell them equipment."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Dario of Ab'Dendriel."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is unimportant to me."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The temple is somewhere south at the coast."})
keywordHandler:addKeyword({'arkhothep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh seems to be mighty beyond imagination."})
keywordHandler:addKeyword({'ashmunrah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There was some fighting long ago. The old pharaoh lost his power to his son Arkhothep."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Scarabs are dangerous. They are quick, resistant to poison and theis shells are hard as steel."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I travel a lot to see everything. For now I settle here for some time."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was there some time ago. It was lovely and reminded me of my home Ab'Dendriel."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is too crowded for my taste."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think Edron is quite typical for a human settlement."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I did not like the greedy attitude of the people there."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The small people are too hectic and greedy. They don't understand the harmony of nature."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The small people are too hectic and greedy. They don't understand the harmony of nature."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The small people are too hectic and greedy. They don't understand the harmony of nature."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes I miss my brethren and sisters. But for now I want to see the world and travel around."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes I miss my brethren and sisters. But for now I want to see the world and travel around."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes I miss my brethren and sisters. But for now I want to see the world and travel around."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You should ask about him in Darashia. People there talked a lot about him."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This continent is hard and challenging. I like challenges."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city seemed a bit dull and peacefull to me, so I left for Ankrahmun."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ankrahmun is unlike any other city I've seen. Sometimes it gives me shivers ... on the other hand it makes me stay on guard and feel alive, despite the undeath cult."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for this human concepts."})
keywordHandler:addKeyword({"Akh'rah Uthun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for this human concepts."})
keywordHandler:addKeyword({'Akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for this human concepts."})
keywordHandler:addKeyword({'Rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for this human concepts."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for this human concepts."})
keywordHandler:addKeyword({'undea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't understand this cult yet. Just ask around and people will tell you."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "People who fight here do it on their own choice. So I don't care."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Under the palace are crypts, full of minor undead and creatures that have failed the pharaoh. He allows everyone to slay them as they see it fit."})

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'arrow'}, 					Cfarrow, 3)
shopModule:addBuyableItem({'power bolt'}, 					Cfpowerbolt, 7)
shopModule:addBuyableItem({'bow'}, 					Cfbow, 400)
shopModule:addSellableItem({'bow'}, 					Cfbow, 100)
shopModule:addBuyableItem({'bolt'}, 					Cfbolt, 4)
shopModule:addBuyableItem({'crossbow'}, 					Cfcrossbow, 500)
shopModule:addSellableItem({'crossbow'}, 					Cfcrossbow, 500)
shopModule:addBuyableItem({'spear'}, 					Cfspear, 9)

npcHandler:addModule(FocusModule:new())