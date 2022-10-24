-- ALTER TABLE `accounts` ADD `vip_time` BIGINT(20) NOT NULL DEFAULT 0;

-- player:getVipTime()
function Player.getVipTime(self)
	local resultId = db.storeQuery("SELECT `vip_time` FROM `accounts` WHERE `id` = '".. self:getAccountId() .."';")
	local time = resultId ~= false and result.getNumber(resultId, "vip_time") or 0
	result.free(resultId)
	return time
end

-- player:isVip()
function Player.isVip(self)
	return self:getVipTime() > os.time() and true or false
end

-- player:addVipDays(days)
function Player.addVipDays(self, days)
	return(self:isVip() and tonumber((days * 86400))) and db.query("UPDATE `accounts` SET `vip_time` = '".. (self:getVipTime() + (days * 86400)) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;") or db.query("UPDATE `accounts` SET `vip_time` = '".. (os.time() + (days * 86400)) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:removeVipDays(days)
function Player.removeVipDays(self, days)
	return(self:isVip() and tonumber((days * 86400))) and db.query("UPDATE `accounts` SET `vip_time` = '".. (self:getVipTime() - (days * 86400)) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;") or db.query("UPDATE `accounts` SET `vip_time` = '".. (os.time() - (days * 86400)) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:setVipDays(days)
function Player.setVipDays(self, days)
	return db.query("UPDATE `accounts` SET `vip_time` = '".. (os.time() - (days * 86400)) .."' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:removeVip()
function Player.removeVip(self)
	db.query("UPDATE `accounts` SET `vip_time` = '0' WHERE `id` ='".. self:getAccountId() .."' LIMIT 1 ;")
end

-- player:sendVipDaysMessage()
function Player.sendVipDaysMessage(self)
	if self:isVip() then
		local vipTime = self:getVipTime() - os.time()
		local vipDays = 1 + (math.floor(vipTime / 86400))
		return self:getVipTime() ~= false and self:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You have '.. vipDays .. ' vip day(s) in your account.')
	end
end

-- player:checkVipLogin()
function Player.checkVipLogin(self)
	if self:getVipTime() > 0 and not self:isVip() then
		return self:removeVip() and self:teleportTo(self:getTown():getTemplePosition())
	end
end

local foodCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)

function Player.feed(self, food)
	local condition = self:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition then
		condition:setTicks(condition:getTicks() + (food * 1000))
	else
		local vocation = self:getVocation()
		if not vocation then
			return nil
		end

		foodCondition:setTicks(food * 1000)
		foodCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, vocation:getHealthGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, vocation:getHealthGainTicks() * 1000)
		foodCondition:setParameter(CONDITION_PARAM_MANAGAIN, vocation:getManaGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_MANATICKS, vocation:getManaGainTicks() * 1000)

		self:addCondition(foodCondition)
	end
	return true
end

function Player.getClosestFreePosition(self, position, extended)
	if self:getAccountType() >= ACCOUNT_TYPE_GOD then
		return position
	end
	return Creature.getClosestFreePosition(self, position, extended)
end

function Player.getDepotItems(self, depotId)
	return self:getDepotChest(depotId, true):getItemHoldingCount()
end

function Player.getLossPercent(self)
	local blessings = 0
	local lossPercent = {
		[0] = 100,
		[1] = 70,
		[2] = 45,
		[3] = 25,
		[4] = 10,
		[5] = 0
	}

	for i = 1, 5 do
		if self:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	return lossPercent[blessings]
end

function Player.isPremium(self)
	return self:getPremiumDays() > 0 or configManager.getBoolean(configKeys.FREE_PREMIUM)
end

function Player.sendCancelMessage(self, message)
	if type(message) == "number" then
		message = Game.getReturnMessage(message)
	end
	return self:sendTextMessage(MESSAGE_STATUS_SMALL, message)
end

function Player.isUsingOtClient(self)
	return self:getClient().os >= CLIENTOS_OTCLIENT_LINUX
end

function Player.sendExtendedOpcode(self, opcode, buffer)
	if not self:isUsingOtClient() then
		return false
	end

	local networkMessage = NetworkMessage()
	networkMessage:addByte(0x32)
	networkMessage:addByte(opcode)
	networkMessage:addString(buffer)
	networkMessage:sendToPlayer(self)
	networkMessage:delete()
	return true
end

APPLY_SKILL_MULTIPLIER = true
local addSkillTriesFunc = Player.addSkillTries
function Player.addSkillTries(...)
	APPLY_SKILL_MULTIPLIER = false
	local ret = addSkillTriesFunc(...)
	APPLY_SKILL_MULTIPLIER = true
	return ret
end

function Player.isDruid(self)
	return isInArray({2, 6}, self:getVocation():getId())
end

function Player.isKnight(self)
	return isInArray({4, 8}, self:getVocation():getId())
end

function Player.isPaladin(self)
	return isInArray({3, 7}, self:getVocation():getId())
end

function Player.isMage(self)
	return isInArray({1, 2, 5, 6}, self:getVocation():getId())
end

function Player.isSorcerer(self)
	return isInArray({1, 5}, self:getVocation():getId())
end

function Player.addAllMounts(self)
	local mounts = Game.getMounts()
	for mount = 1, #mounts do
		self:addMount(mounts[mount].id)
	end
end