local function Notify(text)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(0,1)
end

local function showProgressBar(time, text)
    SendNUIMessage({
        type = 'ui',
        display = true,
        time = time,
        text = text
    })
end

local function resetVoice()
    Notify('Se ha parado el chat de voz')
    showProgressBar(5000, 'Reiniciando voz')
    SetTimeout(5000, function()
        NetworkClearVoiceChannel()
        NetworkSessionVoiceLeave()
        Wait(50)
        NetworkSetVoiceActive(false)
        MumbleClearVoiceTarget(2)
        Wait(1000)
        MumbleSetVoiceTarget(2)
        NetworkSetVoiceActive(true)
        Notify('Chat de voz reiniciado, Disfruta!')
        if (GetResourceState('esx_rpchat') == 'started') then
            ExecuteCommand('me se toma un caramelo')
        end
    end)
end

RegisterCommand('reiniciarvoz', function()
    resetVoice()
end)