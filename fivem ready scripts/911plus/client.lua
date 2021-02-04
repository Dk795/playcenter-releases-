RegisterNetEvent('notify')

AddEventHandler('notify', function(msg)
  TriggerEvent("chatMessage", "", { 0, 0, 0 }, msg)
end)