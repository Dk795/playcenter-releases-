--config
local webhook = "" --modify, also set in your gateway config!
--Change the webhook address to your discord webhook address!
--end config

RegisterServerEvent('notify')

AddEventHandler('chatMessage', function(source, name, msg)
	if string.sub(msg, 1, 5) == "/911 " then
		CancelEvent()
		local len = string.len(msg)
		local msg2 = string.sub(msg, 6, len)
		
		local wh_content = "**New 911 Call!** ("..name..")\n\n"..msg2
		
		PerformHttpRequest(webhook, process, "POST", "content="..wh_content.."&tts=true")
		local msg = "Dispatcher Notified: "..msg2
		
		function process(statusCode, text, headers)
			--done
		end
		
		TriggerClientEvent("notify", source, msg)
	elseif string.sub(msg, 1, 7) == "/panic2 " then
		CancelEvent()
		local len = string.len(msg)
		local msg2 = string.sub(msg, 8, len)
		
		local wh_content = "**Panic Button Pressed!** ("..name..")\n\nLocation: "..msg2
		
		PerformHttpRequest(webhook, process, "POST", "content="..wh_content.."&tts=true")
		local msg = "Panic Button Pressed"
		
		function process(statusCode, text, headers)
			--done
		end
		
		TriggerClientEvent("notify", source, msg)
	end
end)