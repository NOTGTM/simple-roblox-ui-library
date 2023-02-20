-- define UI library
local Tabs = {}
Tabs.__index = Tabs

function Tabs.new()
    local self = setmetatable({}, Tabs)
    self.Tabs = {}
    return self
end

function Tabs:AddTab(name, frame)
    self.Tabs[name] = frame
    frame.Visible = false
end

function Tabs:SwitchToTab(name)
    for tabName, tabFrame in pairs(self.Tabs) do
        if tabName == name then
            tabFrame.Visible = true
        else
            tabFrame.Visible = false
        end
    end
end

-- create tabs object and add tabs
local tabs = Tabs.new()

local tab1Frame = Instance.new("Frame")
tab1Frame.Size = UDim2.new(1, 0, 1, 0)
tab1Frame.BackgroundColor3 = Color3.new(1, 0, 0)

local tab2Frame = Instance.new("Frame")
tab2Frame.Size = UDim2.new(1, 0, 1, 0)
tab2Frame.BackgroundColor3 = Color3.new(0, 1, 0)

tabs:AddTab("Tab 1", tab1Frame)
tabs:AddTab("Tab 2", tab2Frame)

-- create UI for switching between tabs
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local tabsFrame = Instance.new("Frame")
tabsFrame.Parent = screenGui
tabsFrame.Size = UDim2.new(1, 0, 0, 50)
tabsFrame.Position = UDim2.new(0, 0, 1, -50)
tabsFrame.BackgroundColor3 = Color3.new(0, 0, 0)

for tabName, _ in pairs(tabs.Tabs) do
    local button = Instance.new("TextButton")
    button.Parent = tabsFrame
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 100 * (#tabsFrame:GetChildren() - 1), 0, 0)
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.Text = tabName
    
    button.MouseButton1Click:Connect(function()
        tabs:SwitchToTab(tabName)
    end)
end

-- switch to initial tab
tabs:SwitchToTab("Tab 1")
