local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Quality armors for sale!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"gfagaga", "gfagagaga"}, msg) then
		if player:getStorageValue(1075) == 5 then
			player:setStorageValue(1075, 6)
			player:setStorageValue(1076, os.time() + (player:getSex() == 0 and 3600 or 7200))
			npcHandler:say('Ah, you must be the hero Trisha talked about. I\'ll prepare the shoulder spikes for you. Please give me some time to finish.', cid)
		elseif player:getStorageValue(1075) == 6 then
			if player:getStorageValue(1076) > os.time() then
				npcHandler:say('I\'m not done yet. Please be as patient as you are courageous.', cid)
				return false
			end

			player:addOutfitAddon(142, 1)
			player:addOutfitAddon(134, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:setStorageValue(1075, 7)
			npcHandler:say('Finished! Since you are a man, I thought you probably wanted two. Men always want that little extra status symbol. <giggles>', cid)
		else
			npcHandler:say('I\'m selling leather armor, chain armor, and brass armor. Ask me for a trade if you like to take a look.', cid)
		end
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'leather armor'}, 					Cfleatherarmor, 5)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 40)
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 112)
shopModule:addSellableItem({'plate armor'}, 					Cfplatearmor, 240)
shopModule:addSellableItem({'steel helmet'}, 					Cfsteelhelmet, 293)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 12)
shopModule:addSellableItem({'brass helmet'}, 					Cfbrasshelmet, 30)
shopModule:addSellableItem({'leather helmet'}, 					Cfleatherhelmet, 3)
shopModule:addSellableItem({'viking helmet'}, 					Cfvikinghelmet, 66)
shopModule:addSellableItem({'plate shield'}, 					Cfplateshield, 45)
shopModule:addSellableItem({'brass shield'}, 					Cfbrassshield, 16)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 3)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 60)
shopModule:addSellableItem({'brass legs'}, 					Cfbrasslegs, 49)
shopModule:addSellableItem({'chain legs'}, 					Cfchainlegs, 20)


shopModule:addBuyableItem({'leather armor'}, 					Cfleatherarmor, 35)
shopModule:addBuyableItem({'chain armor'}, 					Cfchainarmor, 200)
shopModule:addBuyableItem({'brass armor'}, 					Cfbrassarmor, 450)
shopModule:addBuyableItem({'leather helmet'}, 					Cfleatherhelmet, 12)
shopModule:addBuyableItem({'chain helmet'}, 					Cfchainhelmet, 52)
shopModule:addBuyableItem({'brass helmet'}, 					Cfbrasshelmet, 120)
shopModule:addBuyableItem({'viking helmet'}, 					Cfvikinghelmet, 265)
shopModule:addBuyableItem({'wooden shield'}, 					Cfwoodenshield, 15)
shopModule:addBuyableItem({'brass shield'}, 					Cfbrassshield, 65)
shopModule:addBuyableItem({'plate shield'}, 					Cfplateshield, 125)
shopModule:addBuyableItem({'brass legs'}, 					Cfbrasslegs, 195)
shopModule:addBuyableItem({'chain legs'}, 					Cfchainlegs, 80)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I run this armoury. If you want to proctect your life you'd better buy my wares."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I run this armoury. If you want to proctect your life you'd better buy my wares."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Cornelia."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy armor, helmets, and shields. Only the dwarfs can make better ones."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The ancient dwarfen clan halls are far to the east from here."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "With my armor you need not fear any monsters!"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "While exploring the dungeons of the land you will learn how important a good armor is."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sewers are males' business."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "THE GHOSTLANDS??? Make sure to buy the best protection in store before you get even close to them."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell armor, helmets, shields, and trousers."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell armor, helmets, shields, and trousers."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell armor, helmets, shields, and trousers."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are armor, helmets, trousers, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Rowenna in the other shop about it."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling leather helmets, chain helmets, brass helmets, and viking helmets. What do you want?"})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling leather armor, chain armor, and brass armor. What do you need?"})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling wooden shields, brass shields, and plate shields. What do you want?"})
keywordHandler:addKeyword({'trousers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs and brass legs. What do you need?"})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs and brass legs. What do you need?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())