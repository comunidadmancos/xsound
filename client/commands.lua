-- i recommend to NOT change the command name. it will make easier for people to use this command
-- when ever is this library.. so please keep this command name on "streamermode" command
--[[RegisterCommand("streamermode", function(source, args, rawCommand)
    disableMusic = not disableMusic
    if disableMusic then
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_on"] } })

        for k, v in pairs(soundInfo) do
            Destroy(v.id)
        end

    else
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_off"] } })
    end
end, false)]]
local prevVolume = {}
RegisterCommand("streamermode", function(source, args, rawCommand)
    muteMusic = not muteMusic
    if muteMusic then
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_on"] } })

        for k, v in pairs(soundInfo) do
			prevVolume[v.id] = v.volume
            setVolume(v.id, 0.0)
        end

    else
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_off"] } })
        for k, v in pairs(soundInfo) do
            setVolume(v.id, prevVolume[v.id])
        end
    end
end, false)

RegisterNetEvent("ttsallCL")
AddEventHandler("ttsallCL", function(payload)
	TextToSpeech(payload[1] or tostring(math.random(99999, 999999999)), "es-ES", payload[2] or "sa bugueao paco", 0.3, false)
end)