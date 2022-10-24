function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    createWindows(player)
    window:sendToPlayer(player)
    return true
end