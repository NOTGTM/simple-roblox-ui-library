local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NOTGTM/simple-roblox-ui-library/main/ui.lua"))()
local frame = script.Parent.Frame
local tabs = {}
local activeTab = nil

tabs["Tab 1"] = UI.createTabFrame("Tab 1", frame, 1)
tabs["Tab 2"] = UI.createTabFrame("Tab 2", frame, 2)

local container = UI.createTabContainer(frame)

local button1 = UI.createTabButton("Tab 1", frame, 1, function()
    if activeTab ~= tabs["Tab 1"] then
        activeTab = tabs["Tab 1"]
        UI.showTabFrame(activeTab)
    end
end)

local button2 = UI.createTabButton("Tab 2", frame, 2, function()
    if activeTab ~= tabs["Tab 2"] then
        activeTab = tabs["Tab 2"]
        UI.showTabFrame(activeTab)
    end
end)

UI.showTabFrame(tabs["Tab 1"])
