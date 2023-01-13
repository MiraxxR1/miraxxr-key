local IsMenuOpen = false

function OpenTemplateMenu()
    if IsMenuOpen == false then
        if IsMenuOpen then
            IsMenuOpen = false
            RageUI.Visible(templateMenu, false)
        else
            IsMenuOpen = true
            RageUI.Visible(templateMenu, true)
            Citizen.CreateThread(function()
                while IsMenuOpen do
                    RageUI.IsVisible(templateMenu, function()

                    end)
                    Wait(1)
                end
            end)
        end
    end
end