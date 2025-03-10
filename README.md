> # qs-fivem-api
> NOTE: This API is primarily intended for usage with `qs-adminmenu` and `qs-admin-discord` packages, but can be modified to work with anything else.

 ## Usage

`API_SECRET`: Set `Config.API_SECRET` to a unique "password", this has to be sent to the API as `secret` within the JSON payload to ensure request integrity.

`Handle Behavior`: You can modify the "routes" and their respective actions, such as using external script exports, added logic within `qs-fivem-api` and more.  


```lua
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
```

## *Each of the entries in `Config.Router` requires the corresponding parameter `action` to be sent, such as*:

```json
{
    "action": "kick", // or ban, loadPlayers
    "secret": "your secret here"
}
```

### After customizing the actions (or using script defaults) make sure to `ensure qs-fivem-api` in your `server.cfg`, afterwards you can directly `POST` your API at: `https://<YOUR FIVEM SERVER IP>/qs-fivem-api`

> Note: if using localhost or have not set up SSL, use `http` instead of `https`
