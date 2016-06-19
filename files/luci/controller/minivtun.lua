--[[
openwrt-dist-luci: Minivtun
]]--

module("luci.controller.minivtun", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/minivtun") then
		return
	end

	entry({"admin", "services", "minivtun"}, cbi("minivtun"), _("minivtun"), 76).dependent = true
end
