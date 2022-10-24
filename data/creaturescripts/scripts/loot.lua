function onLogin(cid)
local player = Player(cid)
  player:openChannel(9)
  player:openChannel(10)
  return true
end