local vipPosition = Position(32372, 31783, 7) 

function onStepIn(cid, item, position, fromPosition)
    local player = Player(cid)
    if not player then
        return true
    end

    if item.actionid == 1500 then
        if not player:isPremium() then
            player:teleportTo(fromPosition)
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            player:sendCancelMessage('You do not have any premium days.')
        end
    elseif item.actionid == 1501 then
        if player:isPremium() then
            player:teleportTo(vipPosition)
            player:say('!* VIP *!', TALKTYPE_MONSTER_SAY)
            vipPosition:sendMagicEffect(CONST_ME_STUN)
        else
            player:teleportTo(fromPosition)
            player:sendCancelMessage('You do not have any premium days.')
            fromPosition:sendMagicEffect(CONST_ME_POFF)
        end
    end
    return true
end