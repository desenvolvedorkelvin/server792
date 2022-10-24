local config = {
	level_add = 20,
	max_ofertas = 5,
	ofertas_pz = true,
	itens_bloqueados = {2165, 2152, 2148, 2160, 2166, 2167, 2168, 2169, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2343, 2433, 2640, 6132, 6300, 6301, 9932, 9933}
}
function onSay(player, words, param)
	if (param == 'balance') then
		local consulta = db.storeQuery("SELECT * FROM `players` WHERE `id` = " .. player:getGuid() .. ";") 
		local saldo = result.getNumber(consulta, "pix_balance")
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your balance is " .. saldo .. " pix balance of your sales in the market!")
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your balance is " .. saldo .. " pix balance of your sales in the market!")
		return true
	end
	if(param == '') or (param == 'info') then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Use website for more info!")
		return true
	end
	local split = param:split(",")
	if split[2] == nil then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Required parameters. Use !offer info for more information!")
		return false
	end
	split[2] = split[2]:gsub("^%s*(.-)$", "%1")
	_BUSCA_DB = db.storeQuery("SELECT * FROM `pix_system` WHERE `player` = " .. player:getGuid())
	if(split[1] == "add") then
		if(not tonumber(split[3]) or (not tonumber(split[4]))) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Use numbers only.")
			return true
		end
		if(string.len(split[3]) > 7 or (string.len(split[4]) > 3)) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This price or the items quantity is too high.")
			return true
		end
		local itemType, item_s = ItemType(split[2]), ItemType(split[2]):getId()
		if(not item_s) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This item "..itemType.." does not exist!")
			return true
		end
		if(player:getLevel() < config.level_add) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you need a level equal to or higher than (" .. config.level_add .. ") to continue.")
			return true
		end
		if(isInArray(config.itens_bloqueados, item_s)) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You cannot add this item.")
			return true
		end
		if(player:getItemCount(item_s) < tonumber(split[4])) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you don't have this item.")
			return true
		end
		local amount, tmp_BUSCA_DB = 0, _BUSCA_DB
		while tmp_BUSCA_DB ~= false do
			tmp_BUSCA_DB = result.next(_BUSCA_DB)
			amount = amount + 1
		end
		if _BUSCA_DB ~= false then
			local limit = amount >= config.max_ofertas
			if limit then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you've reached the max limit(" .. config.max_ofertas .. ") of item sales publications.")
				return true
			end
			if(config.SendOffersOnlyInPZ) then 
				if(not getTilePzInfo(player:getPosition())) then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you can only use this command while in protection zone.")
					return true
				end
			end
		end
		if(tonumber(split[4]) < 1 or (tonumber(split[3]) < 1)) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you need to enter a number greater than 0.")
			return true
		end
		local itemcount, costgp = math.floor(split[4]), math.floor(split[3])
		player:removeItem(item_s, itemcount)
		db.query("INSERT INTO `pix_system` (`player`, `item_name`, `item_id`, `count`, `cost`, `date`) VALUES (" .. player:getGuid() .. ", \"" .. split[2] .. "\", " .. item_s .. ", " .. itemcount .. ", " .. costgp ..", " .. os.time() .. ")")
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations! You added for sale " .. itemcount .." " .. split[2] .." for " .. costgp .. " pix balance!")
	end
	if(split[1] == "buy") then
		_BUSCA_DB = db.storeQuery("SELECT * FROM `pix_system` WHERE `id` = ".. tonumber(split[2]))
		local player_id, player_vendas, item_ids, costs, item_names, counts = player:getGuid(), result.getNumber(_BUSCA_DB, "player"), result.getNumber(_BUSCA_DB, "item_id"), result.getNumber(_BUSCA_DB, "cost"), result.getString(_BUSCA_DB, "item_name"), result.getNumber(_BUSCA_DB, "count")
		
		if(not tonumber(split[2])) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but only numbers are accepted.")
			return true
		end
		
		
		
		
		
		-- nessa parte aqui o script verifica se o comprador tem gold coin, em vez disso eu quero que verifique
		-- se tem valor na tabela player.pix_balance 
		
		--TESTA ISSO
	
		if(_BUSCA_DB ~= false) then
			local total_custo = costs - player:getMoney() 			
			
			local resultdb = db.storeQuery("SELECT pix_balance FROM `players`  WHERE `id`= " .. player:getGuid() .. ";")
			local saldo = result.getNumber(resultdb, "pix_balance")
			
			if(saldo < costs) then 
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you don't have the amount needed to purchase. Are necessary: "..costs.."pix balance for buy this item: "..item_names..". You have: " .. player:getMoney() .. "pix balance. You need: "..total_custo.." pix balance.")
				return true
			end
			if(player_id == player_vendas) then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you cannot purchase your own item.")
				return true
			end

			if 1==1 then
			db.query("UPDATE `players` SET `pix_balance` = `pix_balance` - " .. costs .. " WHERE `id` = " .. player:getGuid() .. ";")
				if(isItemStackable((item_ids))) then
					player:addItem(item_ids, counts)
				else
					for i = 1, counts do
						player:addItem(item_ids, 1)
					end
				end
				
		
				db.query("DELETE FROM `pix_system` WHERE `id` = " .. split[2] .. ";")
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations! You bought " .. counts .. " ".. item_names .. " for " .. costs .. " pix balance!")
				db.query("UPDATE `players` SET `pix_balance` = `pix_balance` + " .. costs .. " WHERE `id` = " .. player_vendas .. ";")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but the ID "..split[2].." does not exist!.")
		end
	end
	
	if(split[1] == "remove") then
		local _BUSCA_DB = db.storeQuery("SELECT * FROM `pix_system` WHERE `id` = ".. tonumber(split[2]))
		local player_id, player_vendas, item_ids, costs, item_names, counts = player:getGuid(), result.getNumber(_BUSCA_DB, "player"), result.getNumber(_BUSCA_DB, "item_id"), result.getNumber(_BUSCA_DB, "cost"), result.getString(_BUSCA_DB, "item_name"), result.getNumber(_BUSCA_DB, "count")
		if((not tonumber(split[2]))) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but only numbers are accepted.")
			return true
		end
		if(config.SendOffersOnlyInPZ) then 
			if(not getTilePzInfo(player:getPosition())) then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You must be in PZ area when you remove offerts from database.")
				return true
			end
		end 
		if(_BUSCA_DB ~= false) then
			if(player_id == player_vendas) then
				db.query("DELETE FROM `pix_system` WHERE `id` = " .. split[2] .. ";")
				if(isItemStackable(item_ids)) then
					player:addItem(item_ids, counts)
				else
					for i = 1, counts do
						player:addItem(item_ids, 1)
					end
				end
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Congratulations! The ofert "..split[2].." has been successfully removed from the market.\nYou have received: "..counts.." "..item_names..".")
			else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but this offer is not yours")
			end
			result.free(resultado)
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but this ID does not exist.")
		end
	end
	if(split[1] == "withdraw") then
		if((not tonumber(split[2]))) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but only numbers are accepted.")
			return true
		end
		local balance = db.storeQuery("SELECT * FROM `players` WHERE `id` = " .. player:getGuid() .. ";")
		local pix_balance = result.getNumber(balance, "pix_balance") <= 0 and 0 or result.getNumber(balance, "pix_balance")
		if(pix_balance < 1) then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You do not have enough balance to withdraw.")
			result.free(balance)
			return true
		elseif tonumber(split[2]) <= 0 or tonumber(split[2]) > pix_balance then
			player:sendTextMessage(MESSAGE_INFO_DESCR,tonumber(split[2]) <= 0 and "You have to enter a value greater than 0." or "You can only withdraw the total of "..pix_balance..".")
			result.free(balance)
			return true
		end	
		
		local tz = pix_balance - tonumber(split[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "you got it " .. split[2] .. " pix balance of your market sales! Your balance is: "..tz.."pix balance.")
		player:addMoney(tz)
		db.query("UPDATE `players` SET `pix_balance` = ".. tz .." WHERE `id` = " .. player:getGuid() .. ";")
		result.free(balance)
	end
	return true
end