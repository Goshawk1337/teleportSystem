

--E megnyomasaval megnyitod a teleport menut ahol kitudod valasztani a helyet h hova teleportalj
Citizen.CreateThread(function() 
    while true do
        Wait(4)

        for k in pairs(Config.TelLocs) do

        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        local MarkerCoords3D = vector3(Config.TelLocs[k].x, Config.TelLocs[k].y, Config.TelLocs[k].z+1)  --Ez csak azert hogy a 3D text feljebb legyen mint a marker
        local MarkerCoords = vector3(Config.TelLocs[k].x, Config.TelLocs[k].y, Config.TelLocs[k].z)
        local distance =  #(coords - MarkerCoords)

        if distance  <= Config.DrawDistance and not IsMenuOpen then
            DrawMarker(25,  Config.TelLocs[k].x, Config.TelLocs[k].y, Config.TelLocs[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 121, false, false, 2, true, false, false, false)
            if distance <= 5 and not IsMenuOpen then
                ESX.Game.Utils.DrawText3D(MarkerCoords3D, Config.Text3D, Config.Text3DSize, Config.FontType)
            end
        end
            
        if distance < 2.0 and not IsMenuOpen then 
            if IsControlJustPressed(0, 38) and not IsMenuOpen then
                print("kukac")
                TriggerEvent("nh-context:TeleportMenu")
                    end
                end 
            
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
        Wait(10)
        local ped = GetPlayerPed(-1)
    if IsControlJustPressed(0, Config.OpenKey) then 
        if IsPedInAnyVehicle(ped, true) then
            ESX.ShowNotification('Kocsiban nem lehet megnyitni!', 6000)
            return
        else
            TriggerEvent("nh-context:MobileTeleport")
            end
        end
    end
end)


RegisterNetEvent('human_teleport')
AddEventHandler('human_teleport', function()
    local playerPed = GetPlayerPed(-1)
    FreezeEntityPosition(playerPed, true)
    Wait(10)
    SetEntityCoords(playerPed, Config.Humanlabs.x, Config.Humanlabs.y, Config.Humanlabs.z, 0.0, 0.0, 0.0, false)
    FreezeEntityPosition(playerPed, false)

end)

RegisterNetEvent('Drog_teleport')
AddEventHandler('Drog_teleport', function()
    local playerPed = GetPlayerPed(-1)
    FreezeEntityPosition(playerPed, true)
    Wait(10)
    SetEntityCoords(playerPed, Config.Drog1.x, Config.Drog1.y, Config.Drog1.z, 0.0, 0.0, 0.0, false)
    FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent('to_spawn_tp')
AddEventHandler('to_spawn_tp', function()
    local playerPed = GetPlayerPed(-1)
    FreezeEntityPosition(playerPed, true)
    Wait(10)
    SetEntityCoords(playerPed, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, 0.0, 0.0, 0.0, false)
    FreezeEntityPosition(playerPed, false)
end)


RegisterNetEvent("nh-context:TeleportMenu", function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = Config.TeleportHeader,
        },
        {
            header = Config.functionHeader1,
            context = Config.functionContext1,
            event = "human_teleport",
            image = Config.functionImage1,
            args = {1,2}
        },
        {
            header = Config.functionHeader2,
            context = Config.functionContext2,
            event = "Drog_teleport",
            image = Config.functionImage2,
            args = {1,2}
        },
        {
            header = "Menu close",
            context = "",
            event = "nh-context:closeMenu",
            image = "",
            args = {1,2}
        }
    })
end)

RegisterNetEvent("nh-context:MobileTeleport", function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = Config.MainSpawnHeader,
        },
        {
            header = Config.functionHeader1,
            context = Config.functionContext1,
            event = "human_teleport",
            image = Config.functionImage1,
            args = {1,2}
        },
        {
            header = Config.functionHeader2,
            context = Config.functionContext2,
            event = "Drog_teleport",
            image = Config.functionImage2,
            args = {1,2}
        },
        {
            header = Config.SpawnHeader,
            context = Config.SpawnContext,
            event = "to_spawn_tp",
            image = Config.SpawnImage,
            args = {1,2}
        },
        {
            header = "Menu close",
            context = "",
            event = "nh-context:closeMenu",
            image = "",
            args = {1,2}
        }
    })
end)

