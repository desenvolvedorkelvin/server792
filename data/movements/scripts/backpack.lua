function onEquip(player, item, slot)

   player:setCapacity(player:getCapacity() + (5 * 100))

    return true
end
function onDeEquip(player, item, slot)

   player:setCapacity(player:getCapacity())

    return true
end