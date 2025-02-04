ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('trafixpax:speedingFine')
AddEventHandler('trafixpax:speedingFine', function(currentSpeed, speedLimit, speedDiff)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        -- The amount of the penalty is the amount you went with
        local fineAmount = math.floor(currentSpeed)
        
        -- We round the speeds for the display
        currentSpeed = math.floor(currentSpeed)
        speedLimit = math.floor(speedLimit)
        
        -- We always deduct the money, regardless of the balance
        xPlayer.removeAccountMoney('bank', fineAmount)
        
        -- We will request the new balance
        local newBalance = xPlayer.getAccount('bank').money
        
        -- We will notify the player
        TriggerClientEvent('esx:showNotification', source, ('Speeding ticket: $%s\nSpeed: %s km/h\nAllowed: %s km/h\nExceeding: %s km/h\nNew balance: $%s'):format(fineAmount, currentSpeed, speedLimit, speedDiff, newBalance))
    end
end)
