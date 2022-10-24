local exhaustTime = 1000
local blank = 2260

local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_TICKS, exhaustTime)

local runes = {
    ["teste"] = {runeID = 2260, runeAmount = 1, blankAmount = 0, manaCost = 20, levelReq = 8, soul = 0, vocations = {1,2,3,4,5,6,7,8}}}

local function conjuration(player, t, word)

end

function onSay(player, words, param)
    if(player:getCondition(CONDITION_EXHAUST)) then
        doPlayerSendDefaultCancel(player, RETURNVALUE_YOUAREEXHAUSTED)
        return false
    end
   
    local cast = string.lower(words.." "..param)
    local voc = getPlayerVocation(player)
    local errorMessage = nil
   
    if runes[cast] then
        if isInArray(runes[cast].vocations, voc) then
            if player:getLevel() >= runes[cast].levelReq then
                if player:getMana() >= runes[cast].manaCost then
                    if player:getSoul() > runes[cast].soul then
                        if doPlayerRemoveItem(player, blank, runes[cast].blankAmount)then
                            doPlayerAddMana(player, -(runes[cast].manaCost))
                            doPlayerAddItem(player, runes[cast].runeID, runes[cast].runeAmount)
                            doPlayerAddManaSpent(player, runes[cast].manaCost)
                            doPlayerAddSoul(player, runes[cast].soul)
                            doCreatureSay(played, cast, TALKTYPE_ORANGE_1)
                            doSendMagicEffect(getCreaturePosition(player), CONST_ME_MAGIC_BLUE)
                            doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "You conjured "..(runes[cast].runeAmount).." "..(getItemName(runes[cast].runeID)).." runes.")
                        else
                            errorMessage = "You do not have enough blank runes.."
                        end
                    else
                        errorMessage = "You do not have enough soul."
                    end
                else
                    errorMessage = "You do not have enough mana."
                end
            else
                errorMessage = "You do not have the required level for this. You need level "..(runes[cast].levelReq).."."
            end
        else
            errorMessage = "Your vocation cannot cast that spell."
        end   
    else
        errorMessage = "That conjuration spell does not exist."
    end
    if errorMessage then
        errorMessage = errorMessage.."\n--- Valid conjuration spells for you are ---"   
        for pos,val in pairs(runes) do
            if isInArray(runes[pos].vocations, voc) then
                errorMessage = errorMessage.."\n"..pos.." --- which costs "..(runes[pos].manaCost).." mana, "..(runes[pos].soul).." soul and gives you "..(runes[pos].runeAmount).." "..(getItemName(runes[pos].runeID))..""
                if runes[pos].runeAmount > 1 then
                    errorMessage = errorMessage.."s."
                else
                    errorMessage = errorMessage.."."
                end
            end
        end
        doSendMagicEffect(getCreaturePosition(player), CONST_ME_POFF)
        doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, errorMessage)
    end
    player:addCondition(exhaust)   
    return false
end