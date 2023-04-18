local auth = {}

    auth.http = require("socket.http")
    auth.ltn12 = require"ltn12"

    auth.url = "https://192.168.1.84:8080"
    auth.data = [[{"token":"]]..token..[["}]]

function auth.getClipboard()
    auth.clipboard = love.system.getClipboardText()
end

function auth.connect()

    body = {}

    local res, code, headers, status = auth.http.request {
        method = "POST",
        url = "https://192.168.1.84:8080",
        source = auth.ltn12.source.string(auth.data),
        headers = {
            ["content-type"] = "application/json",
            ["content-length"] = auth.data:len()
        },
        sink = auth.ltn12.sink.table(body)
    }
    local response = table.concat(body)


    print(response)

end