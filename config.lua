Config = {}

--Megnyitas Default F5
Config.OpenKey = 166 --Teleport menu megnyitasa a mobilizalt menuben link: https://docs.fivem.net/docs/game-references/controls/

--3D TEXT Config
Config.Text3D = "~b~[E] ~r~hogy megnyisd a teleport menüt!"
Config.Text3DSize = 1.0
Config.FontType = 6

--Teleport CP helyei
Config.TelLocs = {
    vector3(295.0285, -1402.430786, 29.49) 
}

Config.DrawDistance = 9.0 -- rajzolasi tavolsag(gta5 meretek)
Config.DrawText3D = 4.0 -- 3D Text rajzolasi tavolsag

--Teleport coords
Config.Drog1 = vector3(-10.4469, -1489.0325, 30.0401)
Config.Humanlabs = vector3(3513.8633, 3756.5010, 29.9534)
Config.Spawn = vector3(306.356, -1390.5494, 31.5714)


RegisterNetEvent("nh-context:TeleportMenu", function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "NightVision | SCRIPTS",
        },
        {
            header = "NightVision | SCRIPTS",
            context = "Created BY: Goshawk1337",
            event = "human_teleport",
            image = "", -- IMGUR LINK!!
            args = {1,2}
        },
        {
            header = "Drog 1 | NV",
            context = "NightVision | SCRIPTS",
            event = "Drog_teleport",
            image = "",--IMGUR LINK!
            args = {1,2}
        },
        {
            header = "Menu close",
            context = "",
            event = "nh-context:closeMenu",  -- Menü bezárása
            image = "",
            args = {1,2}
        }
    })
end)



    
RegisterNetEvent("nh-context:MobileTeleport", function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "NightVision | SCRIPTS",
        },
        {
            header = "NightVision | SCRIPTS",
            context = "Created BY: Goshawk1337",
            event = "human_teleport",
            image = "", --IMGUR LINK!
            args = {1,2}
        },
        {
            header = "Drog 1 | NV",
            context = "NightVision | SCRIPTS",
            event = "Drog_teleport",
            image = "", --IMGUR LINK!
            args = {1,2}
        },
        { -- Ezek alapján le ctrl + C-vel illetve az event nevét árírva hozzáadtál egy új lokációt(Két menü van!!)
            header = "Spawn | NV",
            context = "Created BY: Goshawk1337",
            event = "to_spawn_tp",
            image = "", --IMGUR LINK!
            args = {1,2}
        },
        {
            header = "Menu close",
            context = "",
            event = "nh-context:closeMenu", -- Menü bezárása
            image = "",
            args = {1,2}
        }
    })
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

--Ezeket le ctrl + C-zed és a x,y,z kordinátákat átállítva meg az event nevét átírva készen is van az új lokáció!
