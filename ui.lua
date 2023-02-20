local UI = {}

function UI.createTabButton(text, parent, layoutOrder, onClick)
    local button = Instance.new("TextButton")
    button.Text = text
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 18
    button.Size = UDim2.new(0, 80, 0, 30)
    button.LayoutOrder = layoutOrder
    button.Parent = parent
    
    button.MouseButton1Click:Connect(onClick)
    
    return button
end

function UI.createTabContainer(parent)
    local container = Instance.new("Frame")
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.Size = UDim2.new(1, 0, 1, -30)
    container.Position = UDim2.new(0, 0, 0, 30)
    container.Parent = parent
    
    return container
end

function UI.createTabFrame(name, parent, layoutOrder)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false
    frame.LayoutOrder = layoutOrder
    frame.Parent = parent
    
    return frame
end

function UI.showTabFrame(tabFrame)
    for _, frame in pairs(tabFrame.Parent:GetChildren()) do
        if frame:IsA("Frame") and frame.Name ~= tabFrame.Name then
            frame.Visible = false
        end
    end
    
    tabFrame.Visible = true
end

return UI
