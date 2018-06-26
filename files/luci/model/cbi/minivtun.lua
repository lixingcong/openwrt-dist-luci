--[[
openwrt-dist-luci: Minivtun
]]--

local m, s, o

if luci.sys.call("pidof minivtun >/dev/null") == 0 then
	m = Map("minivtun", translate("minivtun"), translate("minivtun is running"))
else
	m = Map("minivtun", translate("minivtun"), translate("minivtun is not running"))
end

-- General Setting
s = m:section(TypedSection, "minivtun", translate("General Setting"))
s.anonymous = true

o = s:option(Flag, "enable", translate("Enable"))
o.default = 1
o.rmempty = false

o = s:option(Value, "server", translate("Server Address"))
o.datatype = "host"
o.rmempty = false

o = s:option(Value, "port", translate("Server Port"))
o.datatype = "port"
o.rmempty = false

o = s:option(Value, "password", translate("Password"))
o.password = true
o.rmempty = false

o = s:option(Value, "net", translate("Local Subnet"))
o.placeholder = "10.7.0.2/24"
o.default = "10.7.0.2/24"
o.rmempty = false

o = s:option(Value, "mtu", translate("Override MTU"))
o.placeholder = 1300
o.default = 1300
o.datatype = "range(296,1500)"
o.rmempty = false

o = s:option(Value, "keepalive", translate("Heart-Beats time"))
o.placeholder = 13
o.default = 13
o.datatype = "range(10,30)"
o.rmempty = false

o = s:option(Value, "intf", translate("Interface Name"))
o.placeholder = "mv0"
o.default = "mv0"
o.rmempty = false

return m
