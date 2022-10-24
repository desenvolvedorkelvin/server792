local subType = function(i)
    local ret = ''
    if(i <= 1) then
        ret = ' was killed by '
    elseif(i > 1 and i <= 4) then
        ret = ' was slain by '
    elseif(i > 4 and i <= 7) then
        ret = ' was crushed by '
    elseif(i > 7 and i <= 10) then
        ret = ' was eliminated by '
    elseif(i > 10) then
        ret = ' was annihilated by '
    end
    return ret
end

function onDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)

    local i = 0
    local k = {}
    local creatures = {}
    local identifier = 0x40000000
    local deathList = player:getDamageMap()

    if next(deathList) then
        for creature, damage in pairs(deathList) do
            creature = creature >= identifier and Monster(creature) or Player(creature)

            if creature then
                if not creatures[creature:getName():lower()] then
                    i = i + 1
                    if creature:getMaster() then
                        k[#k+1] = 'a '..creature:getName():lower()..' summoned by '..(creature:getMaster():isPlayer() and "" or "a ")..creature:getMaster():getName()
                    elseif creature:isPlayer() then
                        k[#k+1] = creature:getName()
                    elseif creature:isMonster() then
                        k[#k+1] = 'a '..creature:getName():lower()
                    end
                    k[#k] = k[#k]..', '
                    creatures[creature:getName():lower()] = 1
                end
            end
        end
        k[#k+1] = k[1]:gsub(',', '.')
        k[1] = player:getName()..subType(i)

        -- send message
        sendChannelMessage(10, TALKTYPE_CHANNEL_O, table.concat(k):gsub("(.*),", "%1 and"))
    end
    return true
end