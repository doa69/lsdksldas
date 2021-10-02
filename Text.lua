local function notify(name,text,length)
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "NotificationGUI" then
            v:Destroy()
        end
    end 
    name = name or "Notification"
    text = text or "Hello!"
    length = length or 5
    
    local tweenservice = game:GetService("TweenService")

    local NotifyFirstPosition = UDim2.new(-0.3, 0,0.885, 0)
    local NotifyLastPosition = UDim2.new(0.008, 0,0.885, 0)

    local NotificationGUI = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Button = Instance.new("TextButton")

    NotificationGUI.Name = "NotificationGUI"
    NotificationGUI.Parent = game:GetService("CoreGui")

    Background.Name = "Background"
    Background.Parent = NotificationGUI
    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Background.Position = UDim2.new(-0.300000012, 0, 0.88499999, 0)
    Background.Size = UDim2.new(0, 315, 0, 57)
    Background.Visible = false
    Background.ZIndex = 0

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(56, 56, 56))}
    UIGradient.Parent = Background

    Top.Name = "Top"
    Top.Parent = Background
    Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Top.Size = UDim2.new(0, 315, 0, 21)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Top

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = Background

    Title.Name = "Title"
    Title.Parent = Background
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(0, 315, 0, 21)
    Title.ZIndex = 2
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Notify"
    Title.TextColor3 = Color3.fromRGB(208, 124, 27)
    Title.TextSize = 20.000

    Text.Name = "Text"
    Text.Parent = Background
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0, 0, 0.368421048, 0)
    Text.Size = UDim2.new(0, 315, 0, 36)
    Text.ZIndex = 2
    Text.Font = Enum.Font.SourceSansSemibold
    Text.Text = "Hi"
    Text.TextColor3 = Color3.fromRGB(208, 124, 27)
    Text.TextSize = 14.000
    Text.TextWrapped = true

    Button.Name = "Button"
    Button.Parent = Background
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 1.000
    Button.Position = UDim2.new(0.933333337, 0, 0, 0)
    Button.Size = UDim2.new(0, 21, 0, 21)
    Button.ZIndex = 2
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = "X"
    Button.TextColor3 = Color3.fromRGB(208, 124, 27)
    Button.TextSize = 20.000

    Button.MouseButton1Click:Connect(function()
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
    spawn(function()
        Title.Text = name
        Text.Text = text
        Background.Visible = true
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyLastPosition}):Play()
        wait(length)
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
end

spawn(function()
    if game.PlaceId == 155615604 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/doa69/lsdksldas/main/game.lua", true))()
    else
        notify("Jacob HUB","This game is doesn't supported")
    end
end)
