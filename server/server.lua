
-- Function to send responses
local function sendResponse(source, status, message)
    local response = {
        status = status,
        message = message
    }
    return json.encode(response)
end


-- Handle HTTP Requests
SetHttpHandler(function(req, res)
    if req.method == "POST" then
        req.setDataHandler(function(body)
            local data = json.decode(body)
            if not data or not data.secret or data.secret ~= Config.API_SECRET then
                res.send(sendResponse(req, 403, "Unauthorized"))
                return
            end

            if Config.Router[data.action] then
                Config.Router[data.action].action()
                res.send(sendResponse(req, 200, {}))
            else
                print("Invalid action: " .. tostring(data.action))
                res.send(sendResponse(req, 404, "Invalid action" .. toString(data.action)))
            end
        end)
    else
        res.send(sendResponse(req, 405, "Method Not Allowed"))
    end
end)
