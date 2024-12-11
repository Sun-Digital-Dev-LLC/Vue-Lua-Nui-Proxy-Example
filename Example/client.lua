RegisterCommand("opennui", function()
    SendNUIMessage({
        type = 'display',
        value = true
    })

    SetNuiFocus(true, true)
end, false)

RegisterNuiCallback("close", function(cb)
    SendNUIMessage({
        type = 'display',
        value = false
    })

    cb({})
end)