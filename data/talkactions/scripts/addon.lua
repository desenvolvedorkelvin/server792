local config = {
    ['retro warrior'] = { male = 963, female = 962 },
    ['citizen'] = { male = 128, female = 136 },
    ['hunter'] = { male = 129, female = 137 },
    ['mage'] = { male = 130, female = 141 },
    ['knight'] = { male = 131, female = 139 },
    ['summoner'] = { male = 133, female = 138 },
    ['warrior'] = { male = 134, female = 142 },
    ['barbarian'] = { male = 147, female = 143 },
    ['druid'] = { male = 148, female = 144 },
    ['wizard'] = { male = 149, female = 145 },
    ['oriental'] = { male = 150, female = 146 },
    ['pirate'] = { male = 151, female = 155 },
    ['assassin'] = { male = 152, female = 156 },
    ['beggar'] = { male = 153, female = 157 },
    ['shaman'] = { male = 154, female = 158 },
    ['norseman'] = { male = 251, female = 252 },
    ['nightmare'] = { male = 268, female = 269 },
    ['jester'] = { male = 273, female = 270 },
    ['brotherhood'] = { male = 278, female = 279 },
    ['demonhunter'] = { male = 289, female = 288 },
    ['yalaharian'] = { male = 325, female = 324 },
    ['warmaster'] = { male = 335, female = 336 },

    ['wayfarer'] = { male = 367, female = 366 },
    ['afflicted'] = { male = 430, female = 431 },
    ['elementalist'] = { male = 432, female = 433 },
    ['deepling'] = { male = 463, female = 464 },
    ['insectoid'] = { male = 465, female = 466 },
    ['crystal warlord'] = { male = 512, female = 513 },
    ['soil guardian'] = { male = 516, female = 514 },
    ['demon'] = { male = 541, female = 542 },
    ['cave explorer'] = { male = 574, female = 575 },
    ['dream warden'] = { male = 577, female = 578 }
}

function onSay(cid, words, param)
    local targetOutfit = config[param:lower()]
    if not targetOutfit then
        return false
    end

    local player = Player(cid)
    if player:getSex() == 0 then
        if param == 'mage' then
            targetOutfit.female, targetOutfit.male = 138, 133
        elseif param == 'summoner' then
            targetOutfit.female, targetOutfit.male = 141, 130
        end
    end

    if player:hasOutfit(player:getSex() == 0 and targetOutfit.female or targetOutfit.male, 3) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have already obtained the ' .. param .. ' addons.')
        return false
    end

    if not player:removeItem(8982, 1) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need an addon doll.')
        return false
    end

    player:addOutfitAddon(targetOutfit.female, 3)
    player:addOutfitAddon(targetOutfit.male, 3)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. param .. ' addons!')
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    return false
end