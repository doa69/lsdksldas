--[[

Hank HUB Login

Made by Hank#4242

Discord server = "https://discord.io/hankhub"

]]

-- Key --

_G.Key = "KeyisSus"

-- Variables --

local UserInput = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Local Functions:

local function Ripple(obj)
    spawn(
        function()
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local Circle = Instance.new("ImageLabel")
            Circle.Name = "Circle"
            Circle.Parent = obj
            Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Circle.BackgroundTransparency = 1.000
            Circle.ZIndex = 10
            Circle.Image = "rbxassetid://266543268"
            Circle.ImageColor3 = Color3.fromRGB(211, 211, 211)
            Circle.ImageTransparency = 0.6
            local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
            Circle.Position = UDim2.new(0, NewX, 0, NewY)
            local Size = 0
            if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.X * 1
            elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.Y * 1
            elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.X * 1
            end
            Circle:TweenSizeAndPosition(
                UDim2.new(0, Size, 0, Size),
                UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
                "Out",
                "Quad",
                0.2,
                false
            )
            for i = 1, 15 do
                Circle.ImageTransparency = Circle.ImageTransparency + 0.05
                wait()
            end
            Circle:Destroy()
        end
    )
end

local function DraggingEnabled(frame, parent)

    parent = parent or frame

    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInput.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

local function TweenObj(obj, properties, duration)
    TweenService:Create(obj,TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), properties):Play()
end

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

local function Bnotify(name,text,length,button1,button2,funcbut1,funcbut2)
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "BNotificationGUI" then
            v:Destroy()
        end
    end
    name = name or "Notification"
    text = text or "Test Buttons"
    length = length or 5
    button1 = button1 or "Yes"
    button2 = button2 or "No"
    
    local tweenservice = game:GetService("TweenService")
    
    local NotifyFirstPosition = UDim2.new(-0.3, 0,0.82, 0)
    local NotifyLastPosition = UDim2.new(0.008, 0,0.82, 0)
    
    local NotifyFirstColor = Color3.fromRGB(25, 25, 25)
    local NotifyLastColor = Color3.fromRGB(208, 124, 27)
    
    local BNotificationGUI = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local Button1 = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local Button2 = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")

    BNotificationGUI.Name = "BNotificationGUI"
    BNotificationGUI.Parent = game:GetService("CoreGui")

    Background.Name = "Background"
    Background.Parent = BNotificationGUI
    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Background.Position = UDim2.new(0.00799999665, 0, 0.817980587, 0)
    Background.Size = UDim2.new(0, 315, 0, 95)
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
    Text.Position = UDim2.new(0, 0, 0.216494843, 0)
    Text.Size = UDim2.new(0, 315, 0, 42)
    Text.ZIndex = 2
    Text.Font = Enum.Font.SourceSansSemibold
    Text.Text = "Hi"
    Text.TextColor3 = Color3.fromRGB(208, 124, 27)
    Text.TextSize = 14.000
    Text.TextWrapped = true

    Exit.Name = "Exit"
    Exit.Parent = Background
    Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(0.933333337, 0, 0, 0)
    Exit.Size = UDim2.new(0, 21, 0, 21)
    Exit.ZIndex = 2
    Exit.Font = Enum.Font.SourceSansBold
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(208, 124, 27)
    Exit.TextSize = 20.000

    Button1.Name = "Button1"
    Button1.Parent = Background
    Button1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button1.Position = UDim2.new(0.244444445, 0, 0.721758068, 0)
    Button1.Size = UDim2.new(0, 70, 0, 20)
    Button1.ZIndex = 2
    Button1.Font = Enum.Font.SourceSansSemibold
    Button1.Text = "Ok"
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button1.TextSize = 14.000
    Button1.TextWrapped = true

    UICorner_3.CornerRadius = UDim.new(0, 5)
    UICorner_3.Parent = Button1

    Button2.Name = "Button2"
    Button2.Parent = Background
    Button2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button2.Position = UDim2.new(0.517460346, 0, 0.721758068, 0)
    Button2.Size = UDim2.new(0, 70, 0, 20)
    Button2.ZIndex = 2
    Button2.Font = Enum.Font.SourceSansSemibold
    Button2.Text = "Cancel"
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button2.TextSize = 14.000
    Button2.TextWrapped = true

    UICorner_4.CornerRadius = UDim.new(0, 5)
    UICorner_4.Parent = Button2
    
    Exit.MouseButton1Click:Connect(function()
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
    
    Button1.MouseButton1Click:Connect(funcbut1)
    
    Button2.MouseButton1Click:Connect(funcbut2)
    
    spawn(function()
        Title.Text = name
        Text.Text = text
        Button1.Text = button1
        Button2.Text = button2
        Background.Visible = true
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyLastPosition}):Play()
        wait(length)
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
end

local function CopyInvite()
    local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    
    clipBoard("https://discord.gg/q9ksgNqxRN")
end

local function Canceled()
    tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
    wait(2)
    Background.Visible = false
end

-- Instances:

local HankHubLogin = Instance.new("ScreenGui")
local MainBackground = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Background = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Text_Login = Instance.new("TextLabel")
local MainTitle_Back = Instance.new("Frame")
local MainTitle = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local MainTitle2 = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local TextBox_Login = Instance.new("TextBox")
local UICorner_6 = Instance.new("UICorner")
local visibility = Instance.new("ImageButton")
local Btn_GetKey = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Btn_Verify = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local visibility_off = Instance.new("ImageButton")

--Properties:

HankHubLogin.Name = "HankHubLogin"
HankHubLogin.Parent = game:GetService("CoreGui")
HankHubLogin.ResetOnSpawn = false

MainBackground.Name = "MainBackground"
MainBackground.Parent = HankHubLogin
MainBackground.Active = true
MainBackground.Visible = true
MainBackground.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
MainBackground.BackgroundTransparency = 0.8
MainBackground.Position = UDim2.new(-0.28, 0,0.337, 0)
MainBackground.Selectable = true
MainBackground.Size = UDim2.new(0, 300, 0, 184)
MainBackground.ZIndex = 0

DraggingEnabled(Background, MainBackground)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = MainBackground

Background.Name = "Background"
Background.Parent = MainBackground
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.Position = UDim2.new(0.0266666673, 0, 0.0326086953, 0)
Background.Size = UDim2.new(0, 284, 0, 172)

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = Background

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(56, 56, 56))}
UIGradient.Parent = Background

Text_Login.Name = "Text_Login"
Text_Login.Parent = Background
Text_Login.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_Login.BackgroundTransparency = 1.000
Text_Login.Position = UDim2.new(0.147887319, 0, 0.284883708, 0)
Text_Login.Size = UDim2.new(0, 200, 0, 30)
Text_Login.Font = Enum.Font.SourceSansBold
Text_Login.Text = "LOGIN"
Text_Login.TextColor3 = Color3.fromRGB(208, 124, 27)
Text_Login.TextSize = 30.000
Text_Login.TextWrapped = true

MainTitle_Back.Name = "MainTitle_Back"
MainTitle_Back.Parent = Background
MainTitle_Back.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainTitle_Back.Size = UDim2.new(0, 123, 0, 36)

MainTitle.Name = "MainTitle"
MainTitle.Parent = MainTitle_Back
MainTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainTitle.BackgroundTransparency = 1.000
MainTitle.Size = UDim2.new(0, 80, 0, 36)
MainTitle.ZIndex = 2
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.Text = "Jacob"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 25.000
MainTitle.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = MainTitle

UICorner_4.CornerRadius = UDim.new(0, 5)
UICorner_4.Parent = MainTitle_Back

MainTitle2.Name = "MainTitle2"
MainTitle2.Parent = MainTitle_Back
MainTitle2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainTitle2.BackgroundTransparency = 1.000
MainTitle2.Position = UDim2.new(0.463414639, 0, 0, 0)
MainTitle2.Size = UDim2.new(0, 66, 0, 36)
MainTitle2.ZIndex = 2
MainTitle2.Font = Enum.Font.SourceSansBold
MainTitle2.Text = "HUB"
MainTitle2.TextColor3 = Color3.fromRGB(208, 124, 27)
MainTitle2.TextSize = 25.000
MainTitle2.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = MainTitle2

TextBox_Login.Name = "TextBox_Login"
TextBox_Login.Parent = Background
TextBox_Login.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox_Login.Position = UDim2.new(0.147887319, 0, 0.5, 0)
TextBox_Login.Size = UDim2.new(0, 180, 0, 20)
TextBox_Login.Font = Enum.Font.SourceSansLight
TextBox_Login.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
TextBox_Login.PlaceholderText = "Insert your key here"
TextBox_Login.Text = ""
TextBox_Login.TextColor3 = Color3.fromRGB(208, 124, 27)
TextBox_Login.TextSize = 14.000
TextBox_Login.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0, 5)
UICorner_6.Parent = TextBox_Login

visibility.Name = "visibility"
visibility.Parent = Background
visibility.BackgroundTransparency = 1.000
visibility.LayoutOrder = 4
visibility.Position = UDim2.new(0.824225366, 0, 0.48167339, 0)
visibility.Size = UDim2.new(0, 25, 0, 25)
visibility.Image = "rbxassetid://3926307971"
visibility.ClipsDescendants = true
visibility.ImageRectOffset = Vector2.new(84, 44)
visibility.ImageRectSize = Vector2.new(36, 36)

Btn_GetKey.Name = "Btn_GetKey"
Btn_GetKey.Parent = Background
Btn_GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Btn_GetKey.Position = UDim2.new(0.147887319, 0, 0.674418628, 0)
Btn_GetKey.Size = UDim2.new(0, 80, 0, 20)
Btn_GetKey.Font = Enum.Font.SourceSansSemibold
Btn_GetKey.Text = "GET KEY"
Btn_GetKey.TextColor3 = Color3.fromRGB(208, 124, 27)
Btn_GetKey.TextSize = 14.000
Btn_GetKey.ClipsDescendants = true
Btn_GetKey.TextWrapped = true

UICorner_7.CornerRadius = UDim.new(0, 5)
UICorner_7.Parent = Btn_GetKey

Btn_Verify.Name = "Btn_Verify"
Btn_Verify.Parent = Background
Btn_Verify.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Btn_Verify.Position = UDim2.new(0.50000006, 0, 0.674418628, 0)
Btn_Verify.Size = UDim2.new(0, 80, 0, 20)
Btn_Verify.Font = Enum.Font.SourceSansSemibold
Btn_Verify.Text = "VERIFY"
Btn_Verify.TextColor3 = Color3.fromRGB(208, 124, 27)
Btn_Verify.TextSize = 14.000
Btn_Verify.ClipsDescendants = true
Btn_Verify.TextWrapped = true

UICorner_8.CornerRadius = UDim.new(0, 5)
UICorner_8.Parent = Btn_Verify

visibility_off.Name = "visibility_off"
visibility_off.Parent = Background
visibility_off.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
visibility_off.BackgroundTransparency = 1.000
visibility_off.LayoutOrder = 14
visibility_off.Position = UDim2.new(0.824225366, 0, 0.48167339, 0)
visibility_off.Size = UDim2.new(0, 25, 0, 25)
visibility_off.Visible = false
visibility_off.ClipsDescendants = true
visibility_off.Image = "rbxassetid://3926307971"
visibility_off.ImageColor3 = Color3.fromRGB(208, 124, 27)
visibility_off.ImageRectOffset = Vector2.new(564, 44)
visibility_off.ImageRectSize = Vector2.new(36, 36)

-- Scripts:

spawn(function()
    TweenObj(MainBackground, {Position = UDim2.new(0.362, 0,0.337, 0)}, 3)
end)

Btn_GetKey.MouseButton1Click:Connect(function()
    Ripple(Btn_GetKey)
    TweenObj(Btn_GetKey, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.4)
    wait(0.5)
    TweenObj(Btn_GetKey, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.4)
    Bnotify("Jacob Hub","Copy invite link by click Copy button",15,"Copy","Cancel",CopyInvite,Canceled)
end)

Btn_Verify.MouseButton1Click:Connect(function()
    Ripple(Btn_Verify)
    TweenObj(Btn_Verify, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.4)
    wait(0.5)
    TweenObj(Btn_Verify, {BackgroundColor3 = Color3.fromRGB(25 ,25, 25)}, 0.4)
    if TextBox_Login.Text == _G.Key then
        notify("Jacob Hub","Verifying..",5)
        wait(5)
        notify("Jacob Hub","Correct key!",2)
        HankHubLogin:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HankRBXHelper/Hank-HUB-UI-Library/main/%5BHH%5D%20Hank%20HUB%20Game%20Checker.lua", true))()
    else
        notify("Jacob Hub","Verifying..",5)
        wait(5)
        Bnotify("Jacob Hub","The key is incorrect! Please join our discord server to get new key",15,"Copy invite","Cancel",CopyInvite,Canceled)
    end
end)

visibility.MouseButton1Click:Connect(function()
    visibility.Visible = false
    visibility_off.Visible = true
    TweenObj(TextBox_Login, {BackgroundColor3 = Color3.fromRGB(208, 124, 27)}, 0.4)
    wait(0.4)
    TextBox_Login.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
end)

visibility_off.MouseButton1Click:Connect(function()
    visibility.Visible = true
    visibility_off.Visible = false
    TweenObj(TextBox_Login, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.4)
    wait(0.4)
    TextBox_Login.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
end)
