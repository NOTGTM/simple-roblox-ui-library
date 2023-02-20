local Gui = {}

function Gui.new(title, parent)
    local windowSize = Vector2.new(400, 300)
    local topbarSize = 24
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, windowSize.X, 0, windowSize.Y)
    frame.Position = UDim2.new(0.5, -windowSize.X/2, 0.5, -windowSize.Y/2)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    frame.Draggable = true
    
    local topbar = Instance.new("Frame")
    topbar.Size = UDim2.new(1, 0, 0, topbarSize)
    topbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    topbar.BorderSizePixel = 0
    topbar.Parent = frame
    
    local titleText = Instance.new("TextLabel")
    titleText.Text = title
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.BackgroundTransparency = 1
    titleText.Font = Enum.Font.SourceSansBold
    titleText.TextSize = 14
    titleText.Size = UDim2.new(1, -50, 1, 0)
    titleText.Position = UDim2.new(0, 50, 0, 0)
    titleText.Parent = topbar
    
    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundTransparency = 1
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 14
    closeButton.Size = UDim2.new(0, 25, 0, topbarSize)
    closeButton.Position = UDim2.new(1, -25, 0, 0)
    closeButton.Parent = topbar
    
    closeButton.MouseButton1Click:Connect(function()
        frame:Destroy()
    end)
    
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 14
    minimizeButton.Size = UDim2.new(0, 25, 0, topbarSize)
    minimizeButton.Position = UDim2.new(1, -50, 0, 0)
    minimizeButton.Parent = topbar
    
    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = false
    end)
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 1, -topbarSize)
    contentFrame.Position = UDim2.new(0, 0, 0, topbarSize)
    contentFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = frame
    
    return {
        Frame = frame,
        ContentFrame = contentFrame,
    }
end
