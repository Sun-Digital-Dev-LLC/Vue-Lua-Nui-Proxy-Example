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

    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNuiCallback("message", function(cb, data)
    print(data.message)
    cb('ok')
end)

