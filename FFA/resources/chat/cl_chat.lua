local teleporttausspawni111 = false
local teleporttausspawni222 = false
local teleporttausspawni333 = false
local teleporttausspawni444 = false

local function WCxE7tdzZmeMNY7j(text, x, y, font, color, scale)
  SetTextColour(color.r, color.g, color.b, color.a)
  SetTextFont(font)
  SetTextScale(scale, scale)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x, y)
end








local myVar1 = "UNKNOWN"
local myVar4 = "UNKNOWN"
local justpressed = false
local kuolemat = 0
local tapot = 0
local monesko = 0

RegisterNetEvent('Tiedottannesaatana')
AddEventHandler('Tiedottannesaatana', function(ykkone,ykkonenimi,ykkonekuoli,monesko,tapot,kuolemat)
	myVar1 = "~y~#1 Nimi: "..ykkonenimi..", Tapot: "..ykkone..", Kuolemat: "..ykkonekuoli
	myVar4 = "#"..monesko.." Nimi: SINÄ, "..", Tapot: "..tapot..", Kuolemat: "..kuolemat
end)




local listOn = false
local Faketimer = 0
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
			if IsControlPressed(0, 178) --[[ INPUT_PHONE ]] then
					if not justpressed then
						TriggerServerEvent("leaderboardtiedot",GetPlayerServerId(PlayerId()))
						justpressed = true
					end
					DrawRect(0, 0, 0.36, 0.14, 0, 0, 0, 190)
					local color = {r=255,g=255,b=255,a = 255}
					WCxE7tdzZmeMNY7j(myVar1,0.0,0.0,4,color,0.4)
					WCxE7tdzZmeMNY7j(myVar4,0.0,0.02,4,color,0.4)

            
        end
    end
end)

Citizen.CreateThread(function() -- Thread for  timer
	while true do 
		Citizen.Wait(2000)
		if justpressed then
			justpressed = false
		end
	end 
end)

WeaponNames = {
			   [tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
			   [tostring(GetHashKey('WEAPON_KNIFE'))] = 'Knife',
			   [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'Nightstick',
			   [tostring(GetHashKey('WEAPON_HAMMER'))] = 'Hammer',
			   [tostring(GetHashKey('WEAPON_BAT'))] = 'Baseball Bat',
			   [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'Golf Club',
			   [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'Crowbar',
			   [tostring(GetHashKey('WEAPON_PISTOL'))] = 'Pistol',
			   [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'Combat Pistol',
			   [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'AP Pistol',
			   [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'Pistol .50',
			   [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'Micro SMG',
			   [tostring(GetHashKey('WEAPON_SMG'))] = 'SMG',
			   [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'Assault SMG',
			   [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'Assault Rifle',
			   [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'Carbine Rifle',
			   [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'Advanced Rifle',
			   [tostring(GetHashKey('WEAPON_MG'))] = 'MG',
			   [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'Combat MG',
			   [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'Pump Shotgun',
			   [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'Sawed-Off Shotgun',
			   [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'Assault Shotgun',
			   [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'Bullpup Shotgun',
			   [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'Stun Gun',
			   [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'Sniper Rifle',
			   [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'Heavy Sniper',
			   [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'Remote Sniper',
			   [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'Grenade Launcher',
			   [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'Smoke Grenade Launcher',
			   [tostring(GetHashKey('WEAPON_RPG'))] = 'RPG',
			   [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'Passenger Rocket',
			   [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'Airstrike Rocket',
			   [tostring(GetHashKey('WEAPON_STINGER'))] = 'Stinger [Vehicle]',
			   [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'Minigun',
			   [tostring(GetHashKey('WEAPON_GRENADE'))] = 'Grenade',
			   [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'Sticky Bomb',
			   [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'Tear Gas',
			   [tostring(GetHashKey('WEAPON_BZGAS'))] = 'BZ Gas',
			   [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'Molotov',
			   [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'Fire Extinguisher',
			   [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'Jerry Can',
			   [tostring(GetHashKey('OBJECT'))] = 'Object',
			   [tostring(GetHashKey('WEAPON_BALL'))] = 'Ball',
			   [tostring(GetHashKey('WEAPON_FLARE'))] = 'Flare',
			   [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'Tank Cannon',
			   [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Rockets',
			   [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'Laser',
			   [tostring(GetHashKey('AMMO_RPG'))] = 'Rocket',
			   [tostring(GetHashKey('AMMO_TANK'))] = 'Tank',
			   [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'Rocket',
			   [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'Laser',
			   [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'Laser',
			   [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'Rammed by Car',
			   [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'Bottle',
			   [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'Gusenberg Sweeper',
			   [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'SNS Pistol',
			   [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'Vintage Pistol',
			   [tostring(GetHashKey('WEAPON_DAGGER'))] = 'Antique Cavalry Dagger',
			   [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'Flare Gun',
			   [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'Heavy Pistol',
			   [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'Special Carbine',
			   [tostring(GetHashKey('WEAPON_MUSKET'))] = 'Musket',
			   [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'Firework Launcher',
			   [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'Marksman Rifle',
			   [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'Heavy Shotgun',
			   [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'Proximity Mine',
			   [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'Homing Launcher',
			   [tostring(GetHashKey('WEAPON_HATCHET'))] = 'Hatchet',
			   [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'Combat PDW',
			   [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'Knuckle Duster',
			   [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'Marksman Pistol',
			   [tostring(GetHashKey('WEAPON_MACHETE'))] = 'Machete',
			   [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'Machine Pistol',
			   [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'Flashlight',
			   [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'Double Barrel Shotgun',
			   [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'Compact Rifle',
			   [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'Switchblade',
			   [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'Heavy Revolver',
			   [tostring(GetHashKey('WEAPON_FIRE'))] = 'Fire',
			   [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'Heli Crash',
			   [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'Run over by Car',
			   [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'Hit by Water Cannon',
			   [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'Exhaustion',
			   [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'Explosion',
			   [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'Electric Fence',
			   [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'Bleeding',
			   [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'Drowning in Vehicle',
			   [tostring(GetHashKey('WEAPON_DROWNING'))] = 'Drowning',
			   [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'Barbed Wire',
			   [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'Vehicle Rocket',
			   [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'Bullpup Rifle',
			   [tostring(GetHashKey('WEAPON_ASSAULTSNIPER'))] = 'Assault Sniper',
			   [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'Rotors',
			   [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'Railgun',
			   [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'Air Defence Gun',
			   [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'Automatic Shotgun',
			   [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'Battle Axe',
			   [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'Compact Grenade Launcher',
			   [tostring(GetHashKey('WEAPON_MINISMG'))] = 'Mini SMG',
			   [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'Pipebomb',
			   [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'Poolcue',
			   [tostring(GetHashKey('WEAPON_WRENCH'))] = 'Wrench',
			   [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'Snowball',
			   [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'Animal',
			   [tostring(GetHashKey('WEAPON_COUGAR'))] = 'Cougar'
			  }

local vetidiet = false

secondsUntilKick = 1200 

kickWarning = true



Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1Sinut potkitaan ulos " .. time .. " sekuntin päästä, koska olet ollut liian pitkää AFK!")
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)


local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')
RegisterNetEvent('chat:toggleChat')



-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEntered')

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text)
  local args = { text }
  if author ~= "" then
    table.insert(args, 1, author)
  end
  if(not chatVisibilityToggle)then

end
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
  print(msg)
  if(not chatVisibilityToggle)then

end
end)

AddEventHandler('chat:addMessage', function(message)
	if(not chatVisibilityToggle)then

end
end)

AddEventHandler('chat:addSuggestion', function(name, help, params)

end)

AddEventHandler('chat:addSuggestions', function(suggestions)
  for _, suggestion in ipairs(suggestions) do

  end
end)



AddEventHandler('chat:removeSuggestion', function(name)

end)

AddEventHandler('chat:addTemplate', function(id, html)

end)

AddEventHandler('chat:clear', function(name)

end)

AddEventHandler('chat:toggleChat',function()
  chatVisibilityToggle = not chatVisibilityToggle

  local state = (chatVisibilityToggle == true) and "^1disabled" or "^2enabled"


end)

RegisterNUICallback('chatResult', function(data, cb)
  chatInputActive = false
  SetNuiFocus(false)

  if not data.canceled then
    local id = PlayerId()   

    --deprecated
    local r, g, b = 0, 0x99, 255

    if data.message:sub(1, 1) == '/' then
      ExecuteCommand(data.message:sub(2))
    else
      TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, data.message)
    end
  end

  cb('ok')
end)

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end

local function refreshThemes()
  local themes = {}

  for resIdx = 0, GetNumResources() - 1 do 
    local resource = GetResourceByFindIndex(resIdx)

    if GetResourceState(resource) == 'started' then
      local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

      if numThemes > 0 then
        local themeName = GetResourceMetadata(resource, 'chat_theme')
        local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

        if themeName and themeData then
          themeData.baseUrl = 'nui://' .. resource .. '/'
          themes[themeName] = themeData
        end
      end
    end
  end


end

AddEventHandler('onClientResourceStart', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init');

  refreshCommands()
  refreshThemes()

  chatLoaded = true	

  cb('ok')
end)

Citizen.CreateThread(function()
  SetTextChatEnabled(false)
  SetNuiFocus(false)
  Citizen.Wait(10000)
  while true do
    Wait(0)





    if chatLoaded then
      local shouldBeHidden = false

      if IsScreenFadedOut() or IsPauseMenuActive() then
        shouldBeHidden = true
      end

      if (shouldBeHidden and not chatHidden) or (not shouldBeHidden and chatHidden) then
        chatHidden = shouldBeHidden


      end
    end
  end
end)

RegisterCommand('die', function()
	vetidiet = true
	SetEntityHealth(GetPlayerPed(-1), 0)
end, false)


Citizen.CreateThread(function()
	local isSniper = false
	while true do
		Citizen.Wait(0)

    	local ped = GetPlayerPed(-1)

		
		local currentWeaponHash = GetSelectedPedWeapon(ped)

		if currentWeaponHash == 100416529 then
			isSniper = true
		elseif currentWeaponHash == 205991906 then
			isSniper = true
		elseif currentWeaponHash == -952879014 then
			isSniper = true
		elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
			isSniper = true
		else
			isSniper = false
		end

		if not isSniper then
			HideHudComponentThisFrame(14)
		end
	end
end)






local spawnit = {
	spawn1 = false,
	spawn2 = false,
	spawn3 = false,
	spawn4 = false,
}
local ase = "WEAPON_PISTOL"


        

        

RegisterNetEvent('settaaspawni')
AddEventHandler('settaaspawni', function(spawni1, spawni2, spawni3, spawni4, tankertainenase)
	spawnit = {
		spawn1 = spawni1,
		spawn2 = spawni2,
		spawn3 = spawni3,
		spawn4 = spawni4,
	}
	ase = tankertainenase
end)

RegisterNetEvent('vaihtujovihhu')
AddEventHandler('vaihtujovihhu', function()
	TriggerEvent("playerSpawned")
end)

function BBWMqktLdH6yHbfd(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

RegisterNetEvent('JUUHILMOTUS')
AddEventHandler('JUUHILMOTUS', function(syy)
	BBWMqktLdH6yHbfd(syy)
end)

local function teleporttausspawni4()
  	local XXXXXX = math.random(0,110)
	local XXXXX = 2888.0+XXXXXX
	local YYYYYY = math.random(0,120)
	local YYYYY = 2715.0+YYYYYY


  teleporttausspawni444 = true
  local zHeigt = 0.0
  height = 1000.0
  while teleporttausspawni444 do
    Citizen.Wait(0)
    if teleporttausspawni444 then
      if
      IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
      (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
      then
        entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
      else
        entity = GetPlayerPed(-1)
      end

      SetEntityCoords(entity, XXXXX, YYYYY, height)
      FreezeEntityPosition(entity, true)
      local Pos = GetEntityCoords(entity, true)

      if zHeigt == 0.0 then
        height = height - 25.0
        SetEntityCoords(entity, Pos.x, Pos.y, height)
        bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
      else
        SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
        FreezeEntityPosition(entity, false)
        teleporttausspawni444 = false

        height = 1000.0
        zHeigt = 0.0
        break
      end
    end
  end
end

local function teleporttausspawni3()
  	local XXXXXX = math.random(0,100)
	local XXXXX = 1315.0+XXXXXX
	local YYYYYY = math.random(0,80)
	local YYYYY = -600.0+YYYYYY


  teleporttausspawni333 = true
  local zHeigt = 0.0
  height = 1000.0
  while teleporttausspawni333 do
    Citizen.Wait(0)
    if teleporttausspawni333 then
      if
      IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
      (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
      then
        entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
      else
        entity = GetPlayerPed(-1)
      end

      SetEntityCoords(entity, XXXXX, YYYYY, height)
      FreezeEntityPosition(entity, true)
      local Pos = GetEntityCoords(entity, true)

      if zHeigt == 0.0 then
        height = height - 25.0
        SetEntityCoords(entity, Pos.x, Pos.y, height)
        bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
      else
        SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
        FreezeEntityPosition(entity, false)
        teleporttausspawni333 = false

        height = 1000.0
        zHeigt = 0.0
        break
      end
    end
  end
end

local function teleporttausspawni2()
  	local XXXXXX = math.random(0,115)
	local XXXXX = -1146.735+XXXXXX
	local YYYYYY = math.random(0,110)
	local YYYYY = 4855.0+YYYYYY


  teleporttausspawni222 = true
  local zHeigt = 0.0
  height = 1000.0
  while teleporttausspawni222 do
    Citizen.Wait(0)
    if teleporttausspawni222 then
      if
      IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
      (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
      then
        entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
      else
        entity = GetPlayerPed(-1)
      end

      SetEntityCoords(entity, XXXXX, YYYYY, height)
      FreezeEntityPosition(entity, true)
      local Pos = GetEntityCoords(entity, true)

      if zHeigt == 0.0 then
        height = height - 25.0
        SetEntityCoords(entity, Pos.x, Pos.y, height)
        bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
      else
        SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
        FreezeEntityPosition(entity, false)
        teleporttausspawni222 = false
        height = 1000.0
        zHeigt = 0.0
        break
      end
    end
  end
end

local function teleporttausspawni1()
  	local XXXXXX = math.random(0,70)
	local XXXXX = -740.0+XXXXXX
	local YYYYYY = math.random(0,130)
	local YYYYY = 5735.0+YYYYYY



  teleporttausspawni111 = true
  local zHeigt = 0.0
  height = 1000.0
  while teleporttausspawni111 do
    Citizen.Wait(0)
    if teleporttausspawni111 then
      if
      IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
      (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
      then
        entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
      else
        entity = GetPlayerPed(-1)
      end

      SetEntityCoords(entity, XXXXX, YYYYY, height)
      FreezeEntityPosition(entity, true)
      local Pos = GetEntityCoords(entity, true)

      if zHeigt == 0.0 then
        height = height - 25.0
        SetEntityCoords(entity, Pos.x, Pos.y, height)
        bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
      else
        SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
        FreezeEntityPosition(entity, false)
        teleporttausspawni111 = false
        height = 1000.0
        zHeigt = 0.0
        break
      end
    end
  end
end

local silupaal = false

RegisterCommand('silu', function()
	RemoveAllPedWeapons(PlayerPedId(-1), true)
	if silupaal == true then
		silupaal = false
		print("POIS PÄÄLTÄ")
	else
		silupaal = true
		print("PÄÄLLÄ")
	end
	GiveLoadout()
end, false)

function GiveLoadout()
	SetEntityHealth(GetPlayerPed(-1), 200)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(ase), 250, false, true)
	Citizen.Wait(100)
	if silupaal then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
	end
end

-- CLIENTSIDED --

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		SetCanAttackFriendly(GetPlayerPed(-1), true, false)
		NetworkSetFriendlyFireOption(true)
		
			local playerId = PlayerId()
			if GetPlayerWantedLevel(playerId) ~= 0 then
				SetPlayerWantedLevel(playerId, 0, false)
				SetPlayerWantedLevelNow(playerId, false)
			end
		SetVehicleDensityMultiplierThisFrame(0.0)	
        SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0) 	
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
	end
end)



RegisterNetEvent('imoitusasiaaxd')
AddEventHandler('imoitusasiaaxd', function()
	BBWMqktLdH6yHbfd("~b~IhA ~g~vItU ~r~hYvÄ ~p~iNfO")
	BBWMqktLdH6yHbfd("~b~aSeEt ~g~Ja ~r~AlUeEt ~p~VaIhTuU")
	BBWMqktLdH6yHbfd("~b~Jos ~g~kuys ~r~tal ~p~lei")
	BBWMqktLdH6yHbfd("~g~SILUN SAA: F8 -> silu")
end)

Citizen.CreateThread(function()  
	Citizen.Wait(1000)
	TriggerServerEvent('MIKASPAWNIHA')
	BBWMqktLdH6yHbfd("~b~IhA ~g~vItU ~r~hYvÄ ~p~iNfO")
	BBWMqktLdH6yHbfd("~b~aSeEt ~g~Ja ~r~AlUeEt ~p~VaIhTuU")
	BBWMqktLdH6yHbfd("~b~Jos ~g~kuys ~r~tal ~p~lei")
	BBWMqktLdH6yHbfd("~g~SILUN SAA: F8 -> silu")
end)


AddEventHandler("playerSpawned", function()

	TriggerServerEvent('MIKASPAWNIHA')
	RemoveAllPedWeapons(PlayerPedId(-1), true)
	Citizen.Wait(100)
	if spawnit.spawn1 then
		teleporttausspawni1()
	elseif spawnit.spawn2 then
		teleporttausspawni2()
	elseif spawnit.spawn3 then
		teleporttausspawni3()
	elseif spawnit.spawn4 then
		teleporttausspawni4()
	end
	GiveLoadout()
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		SetDiscordAppId(764107816264400936)
        SetRichPresence(GetPlayerName(PlayerId()) .. " | Health: "..(GetEntityHealth(GetPlayerPed(-1))-100)) 
        SetDiscordRichPresenceAsset("alokasrplogo") 
        SetDiscordRichPresenceAssetText() 
		if spawnit.spawn1 then
				local pos = GetEntityCoords(PlayerPedId(), true)
				if Vdist(pos.x, pos.y, pos.z, -698.885, 5810.511, 17.32) > 200 then
					if not teleporttausspawni111 then
						teleporttausspawni1()
					end
				end
		elseif spawnit.spawn2 then
				local pos = GetEntityCoords(PlayerPedId(), true)
				if Vdist(pos.x, pos.y, pos.z, -1072.266, 4908.798, 213.318) > 200 then
					if not teleporttausspawni222 then
						teleporttausspawni2()
					end
				end
		elseif spawnit.spawn3 then
				local pos = GetEntityCoords(PlayerPedId(), true)
				if Vdist(pos.x, pos.y, pos.z, 1364.0, -579.0, 75.0) > 200 then
					if not teleporttausspawni333 then
						teleporttausspawni3()
					end
				end
		elseif spawnit.spawn4 then
				local pos = GetEntityCoords(PlayerPedId(), true)
				if Vdist(pos.x, pos.y, pos.z, 2948.0, 2775.0, 39.0) > 200 then
					if not teleporttausspawni444 then
						teleporttausspawni4()
					end
				end
		end
	end
end)




local shot = false
local check = false
local check2 = false
local count = 0

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 25 )
		-- check if player is already in first person
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and check == false then
			    check = false
			else
			    SetFollowPedCamViewMode(4)
			    check = true
			end
		else
		    if check == true then
		        SetFollowPedCamViewMode(1)
				check = false
			end
		end
	end
end )



Citizen.CreateThread(function()
	while true do
		-- Wait 5 seconds after player has loaded in and trigger the event.
		SetBlackout(false)
		Citizen.Wait( 25 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == false and GetFollowPedCamViewMode() ~= 4 then
			check2 = true
			shot = true
			SetFollowPedCamViewMode(4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end
		
		if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot == true and count > 20 then
		        if check2 == true then
				    check2 = false
					shot = false
					SetFollowPedCamViewMode(1)
				end
			end
		end	    
	end
end )



Citizen.CreateThread(function()

	local DeathReason, Killer, DeathCauseHash, Weapon



	while true do

		Citizen.Wait(100)

		if IsEntityDead(PlayerPedId()) then

			Citizen.Wait(500)

			local PedKiller = GetPedSourceOfDeath(PlayerPedId())

			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())

			Weapon = WeaponNames[tostring(DeathCauseHash)]



			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then

				Killer = NetworkGetPlayerIndexFromPed(PedKiller)

			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then

				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))

			end

			if (Killer == PlayerId()) then

				DeathReason = 'itsemurha'

			elseif (Killer == nil) then

				DeathReason = 'kuoli'

			else

				if IsMelee(DeathCauseHash) then

					DeathReason = 'murdered'

				elseif IsTorch(DeathCauseHash) then

					DeathReason = 'torched'

				elseif IsKnife(DeathCauseHash) then

					DeathReason = 'knifed'

				elseif IsPistol(DeathCauseHash) then

					DeathReason = 'pistoled'

				elseif IsSub(DeathCauseHash) then

					DeathReason = 'riddled'

				elseif IsRifle(DeathCauseHash) then

					DeathReason = 'rifled'

				elseif IsLight(DeathCauseHash) then

					DeathReason = 'machine gunned'

				elseif IsShotgun(DeathCauseHash) then

					DeathReason = 'pulverized'

				elseif IsSniper(DeathCauseHash) then

					DeathReason = 'sniped'

				elseif IsHeavy(DeathCauseHash) then

					DeathReason = 'obliterated'

				elseif IsMinigun(DeathCauseHash) then

					DeathReason = 'shredded'

				elseif IsBomb(DeathCauseHash) then

					DeathReason = 'bombed'

				elseif IsVeh(DeathCauseHash) then

					DeathReason = 'mowed over'

				elseif IsVK(DeathCauseHash) then

					DeathReason = 'flattened'

				else

					DeathReason = 'killed'

				end

			end

			


			if not vetidiet then
				if DeathReason == 'itsemurha' or DeathReason == 'kuoli' then
	
					TriggerServerEvent('maalykuolikerrokaikille', GetPlayerName(PlayerId()) .. ' ' .. DeathReason .. '.', Weapon)
					local id = GetPlayerServerId(PlayerId())
					TriggerServerEvent("kuolixdvitunpaska",id,GetPlayerName(PlayerId()))
					TriggerServerEvent('DiscordBotti:pelaajaKuoli', GetPlayerName(PlayerId()), id ,DeathReason, Weapon)
				else
	
					TriggerServerEvent('maalykuolikerrokaikille', GetPlayerName(Killer) .. ' ' .. DeathReason .. ' ' .. GetPlayerName(PlayerId()) .. '.', Weapon)
					local id = GetPlayerServerId(Killer)
					local id1 = GetPlayerServerId(PlayerId())
					TriggerServerEvent("saitaponezilla",id,GetPlayerName(Killer))
					TriggerServerEvent("kuolixdvitunpaska",id1,GetPlayerName(PlayerId()))
					TriggerServerEvent('DiscordBotti:pelaajaKuoli', GetPlayerName(Killer), id,DeathReason, Weapon,GetPlayerName(PlayerId()), id1)
				end
			else
				vetidiet = false
			end


			Killer = nil

			DeathReason = nil

			DeathCauseHash = nil

			Weapon = nil

		end

		while IsEntityDead(PlayerPedId()) do

			Citizen.Wait(0)

		end

	end

end)






function IsMelee(Weapon)

	local Weapons = {'WEAPON_UNARMED', 'WEAPON_CROWBAR', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_HAMMER', 'WEAPON_NIGHTSTICK'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsTorch(Weapon)

	local Weapons = {'WEAPON_MOLOTOV'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsKnife(Weapon)

	local Weapons = {'WEAPON_DAGGER', 'WEAPON_KNIFE', 'WEAPON_SWITCHBLADE', 'WEAPON_HATCHET', 'WEAPON_BOTTLE'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsPistol(Weapon)

	local Weapons = {'WEAPON_SNSPISTOL', 'WEAPON_HEAVYPISTOL', 'WEAPON_VINTAGEPISTOL', 'WEAPON_PISTOL', 'WEAPON_APPISTOL', 'WEAPON_COMBATPISTOL'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsSub(Weapon)

	local Weapons = {'WEAPON_MICROSMG', 'WEAPON_SMG'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsRifle(Weapon)

	local Weapons = {'WEAPON_CARBINERIFLE', 'WEAPON_MUSKET', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_ASSAULTRIFLE', 'WEAPON_SPECIALCARBINE', 'WEAPON_COMPACTRIFLE', 'WEAPON_BULLPUPRIFLE'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsLight(Weapon)

	local Weapons = {'WEAPON_MG', 'WEAPON_COMBATMG'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsShotgun(Weapon)

	local Weapons = {'WEAPON_BULLPUPSHOTGUN', 'WEAPON_ASSAULTSHOTGUN', 'WEAPON_DBSHOTGUN', 'WEAPON_PUMPSHOTGUN', 'WEAPON_HEAVYSHOTGUN', 'WEAPON_SAWNOFFSHOTGUN'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsSniper(Weapon)

	local Weapons = {'WEAPON_MARKSMANRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_HEAVYSNIPER', 'WEAPON_ASSAULTSNIPER', 'WEAPON_REMOTESNIPER'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsHeavy(Weapon)

	local Weapons = {'WEAPON_GRENADELAUNCHER', 'WEAPON_RPG', 'WEAPON_FLAREGUN', 'WEAPON_HOMINGLAUNCHER', 'WEAPON_FIREWORK', 'VEHICLE_WEAPON_TANK'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsMinigun(Weapon)

	local Weapons = {'WEAPON_MINIGUN'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsBomb(Weapon)

	local Weapons = {'WEAPON_GRENADE', 'WEAPON_PROXMINE', 'WEAPON_EXPLOSION', 'WEAPON_STICKYBOMB'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsVeh(Weapon)

	local Weapons = {'VEHICLE_WEAPON_ROTORS'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end



function IsVK(Weapon)

	local Weapons = {'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR'}

	for i, CurrentWeapon in ipairs(Weapons) do

		if GetHashKey(CurrentWeapon) == Weapon then

			return true

		end

	end

	return false

end









