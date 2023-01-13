Settings = {}
Settings.Menu = {}
Settings.Menu.OppeningMenu = 'F1'
Settings.Menu.OppeningMenuDescription = 'Open key menu'
Settings.Menu.Title = 'Key Menu'
Settings.Menu.Description = 'By MiraxxR#0001'
Settings.Menu.IsOpen = false
Settings.KeyList = {
    -- Exemple : {title = "Menu personnel", description = nil, key = 'F5'},
    {title = "", description = nil, key = ''},
}

local key_menu = RageUI.CreateMenu(Settings.Menu.Title, Settings.Menu.Description)
key_menu.Closed = function()
    Settings.Menu.IsOpen = false
    RageUI.Visible(key_menu, false)
end

function OpenKeyMenu()
    if Settings.Menu.IsOpen == false then
        if Settings.Menu.IsOpen then
            Settings.Menu.IsOpen = false
            RageUI.Visible(key_menu, false)
        else
            Settings.Menu.IsOpen = true
            RageUI.Visible(key_menu, true)
            Citizen.CreateThread(function()
                while Settings.Menu.IsOpen do
                    RageUI.IsVisible(key_menu, function()
                        for k, v in pairs(Settings.KeyList) do
                            RageUI.Button(v.title, v.description, { RightLabel = v.key }, true, {})
                        end
                    end)
                    Wait(1)
                end
            end)
        end
    end
end

Keys.Register(Settings.Menu.OppeningMenu, Settings.Menu.OppeningMenu, Settings.Menu.OppeningMenuDescription, function()
    OpenKeyMenu()
end)