local hosts = require("luaflare.hosts")
local vfs = require("luaflare.virtualfilesystem")

local function debian_handler(req, res, path)
	-- /debian/abc
	path = vfs.locate(path)
	-- ./sites/debian-repo/debian/abc
	res:set_file(path, {can_list_directory = true})
end
hosts.any:add("/debian/", debian_handler)
hosts.any:addpattern("/debian/.+", debian_handler)
