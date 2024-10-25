#!/usr/bin/env lua
local handle = io.popen("grep dark ~/.config/alacritty/alacritty.toml ")
local output = handle:read("*a")
-- local time = output:gsub("[\n\r]", " ")
-- local out = output:gsub("[\n\r]", " ")
handle:close()
-- print(time .. "DEBUG: Time recorded when this event happened.")
if output ~= nil then
  print("Dark")
end
