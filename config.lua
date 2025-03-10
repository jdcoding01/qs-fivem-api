

Config = {}

Config.API_SECRET = ""
Config.Router = {
    ['kick'] = {
        label = "Kick Player",
        action = function() 
            exports['qs-adminmenu']:KickPlayer()
        end
    },
    ['ban'] = {
        label = "Ban Player",
        action = function() 
            exports['qs-adminmenu']:BanPlayer()
        end
    },
    ['loadPlayers'] = {
        label = "Load Players",
        action = function() 
            exports['qs-adminmenu']:LoadPlayers()
        end
    }
}
