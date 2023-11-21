-- see: https://gist.github.com/h1k3r/089d43771bdf811eefe8
local _M = {}
function _M.getHostname()
    local f = io.popen ("/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname =string.gsub(hostname, "\n$", "")
    return hostname
end
return _M
