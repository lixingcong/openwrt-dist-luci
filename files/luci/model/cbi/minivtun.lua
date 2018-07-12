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
o.default = 0
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

o = s:option(ListValue, "local_family", translate("Local Subnet Family"))
o:value("IPv4", translate("IPv4"))
o:value("IPv6", translate("IPv6"))
o.rmempty = false

o = s:option(Value, "local_ipaddr4", translate("Local IPv4 Address"))
o:depends("local_family","IPv4")
o.datatype = "ip4addr"
o.default = "10.0.7.2/24"
o.rmempty = true

o = s:option(Value, "local_ipaddr6", translate("Local IPv6 Address"))
o:depends("local_family","IPv6")
o.datatype = "ip6addr"
o.default = "fc00::2/64"
o.rmempty = true

o = s:option(Value, "mtu", translate("Override MTU"))
o.placeholder = 1400
o.datatype = "range(296,1500)"
o.rmempty = false

o = s:option(Value, "keepalive", translate("Heart-Beats time"))
o.placeholder = 20
o.datatype = "range(10,30)"
o.rmempty = false

o = s:option(Value, "intf", translate("Interface Name"))
o.placeholder = "mv0"
o.rmempty = false

return m
