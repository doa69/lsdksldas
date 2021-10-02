


local main = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local a = main:CreateWindow("Main")
local aFolder = a:CreateFolder("Teams")
local aFolder2 = a:CreateFolder("Teleports")

local b = main:CreateWindow("Combat")
local bFolder5 = a:CreateFolder("Melee")
local bFolder1 = a:CreateFolder("Guns")
local bFolder2 = a:CreateFolder("Gun Mods")
local bFolder3 = b:CreateFolder("AimBot")
local bFolder4 = b:CreateFolder("ESP")

local g = main:CreateWindow("Player")
local gFolder = g:CreateFolder("Walkspeed")
local gFolder2 = g:CreateFolder("Jumpower")
local gFolder3 = g:CreateFolder("Invisible")
local gFolder4 = g:CreateFolder("Noclip")




--a--
--a/Teams--
aFolder:Button("Prisoner", function()
    workspace.Remote.TeamEvent:FireServer("Bright orange") 
end)

aFolder:Button("Criminal", function()
    local LP = game.Players.LocalPlayer
    local RE = LP.Character.HumanoidRootPart.Position
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
    wait(0.075)
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(RE)
end)

aFolder:Button("Police", function()
    workspace.Remote.TeamEvent:FireServer("Bright blue")
end)

aFolder:Button("Neatral", function()
    workspace.Remote.TeamEvent:FireServer("Medium stone grey") 
end)
--a/Teleports
aFolder2:Button("Prison Entrance", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(474.655701, 98.1900101, 2250.36841)
end)

aFolder2:Button("Gaurd Room", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798.664368, 99.9900055, 2264.11157)
end)

aFolder2:Button("Yard", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(767.570129, 97.9999466, 2461.25659)
end)

aFolder2:Button("Prison Cells", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.622131, 99.9899902, 2465.79858)
end)

aFolder2:Button("Cafe", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(960.83783, 99.9899597, 2340.33911)
end)

aFolder2:Button("Main Tower", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(823.287292, 130.039948, 2587.73975)
end)

aFolder2:Button("Kitchen", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(941.972778, 99.9899597, 2222.83716)
end)

aFolder2:Button("Police Garage", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(614.918396, 98.2000275, 2512.02368)
end)

aFolder2:Button("Criminal WareHouse", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2128.1180)
end)

--Gun/b
bFolder1:Dropdown("GUNs",{"M9","Remington 870","AK-47",""},true,function(v) --true/false, replaces the current title "Dropdown" with the option that t
	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
	local Event = game:GetService("Workspace").Remote.ItemHandler
	Event:InvokeServer(A_1)
end)
--b/meels
bFolder5:Button("Give All Melee", function()
    local weapons = {"Crude Knife", "Sharpened stick", "Extendo mirror"}
	for i, v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
	    for j, k in pairs(weapons) do
	        if v.Name == k then
	            v:Clone().Parent = game.Players.LocalPlayer.Backpack
	        end
	    end
	end
end)
--b/Gun mode
bFolder2:Button("Mod all weapons", function()
    pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:children()) do 
			local gunstates = v:findFirstChild("GunStates")
			if gunstates then 
				local module = require(gunstates)
				module.Bullets = 10
				module.Spread = 0
				module.CurrentAmmo = 999
				module.StoredAmmo = 9999
				module.AutoFire = true
				module.Range = 10000
				module.FireRate = 0.001
				module.MaxAmmo = 999
				module.Damage = 100
			end
		end
		
		for i, v in pairs(game.Players.LocalPlayer.Character:children()) do 
			local gunstates = v:findFirstChild("GunStates")
			if gunstates then 
				local module = require(gunstates)
				module.Bullets = 100
				module.Spread = 0
				module.CurrentAmmo = 999
				module.StoredAmmo = 9999
				module.AutoFire = true
				module.Range = 10000
				module.FireRate = 0.00001
				module.MaxAmmo = 999
			end
		end
	end)
end)
--AimBot
local aimbotsettings = {
    enabled = false,
    freeforall = false,
    radius = 2500,
    wallcheck = true
}

local players = game:GetService("Players")
local client = players.LocalPlayer
local inputservice = game:GetService("UserInputService")
local mouse = client:GetMouse()
local runservice = game:GetService("RunService")
local aim = false

function GetMouse()
    return Vector2.new(mouse.X, mouse.Y)
end

inputservice.InputBegan:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = true
    end
end)

inputservice.InputEnded:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = false
    end
end)

function FreeForAll(targetplayer)
    if aimbotsettings.freeforall == false then
        if client.Team == targetplayer.Team then return false
        else return true end
    else return true end
end

function NotObstructing(destination, ignore)
    if aimbotsettings.wallcheck then
        Origin = workspace.CurrentCamera.CFrame.p
        CheckRay = Ray.new(Origin, destination- Origin)
        Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
        return Hit == nil
    else
        return true
    end
end

function GetClosestToCuror()
    MousePos = GetMouse()
    Radius = aimbotsettings.radius
    Closest = math.huge
    Target = nil
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if FreeForAll(v) then
            if v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
                Point,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                clientchar = client.Character
                if OnScreen and NotObstructing(v.Character.Head.Position,{clientchar,v.Character}) then
                    Distance = (Vector2.new(Point.X,Point.Y) - MousePos).magnitude
                    if Distance < math.min(Radius,Closest) then
                        Closest = Distance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end 

runservice.RenderStepped:Connect(function()
    if aimbotsettings.enabled == false or aim == false then return end
    ClosestPlayer = GetClosestToCuror()
    if ClosestPlayer then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p,ClosestPlayer.Character.Head.CFrame.p)
    end
end)
-- Enables/Disables aimbot. Essentially its the main toggle.
bFolder3:Toggle( "Enabled", function(value)
    aimbotsettings.enabled = value
end)

-- Enables/Disables wallcheck. It locks on only if the enemy is not obstructed by a part.
bFolder3:Toggle( "Wall Check", function(value)
    aimbotsettings.wallcheck = value
end)

-- Determines if it should only lock onto players who are on the same team or not. Sometimes can get fucked so turning it on is the way to go.
bFolder3:Toggle( "Free For All ", function(value)
    aimbotsettings.freeforall = value
end)
--silentaim
bFolder3:Button("Silent Aim", function()
	local Players = game.Players
	local LocalPlayer = Players.LocalPlayer
	local GetPlayers = Players.GetPlayers
	local Camera = workspace.CurrentCamera
	local WTSP = Camera.WorldToScreenPoint
	local FindFirstChild = game.FindFirstChild
	local Vector2_new = Vector2.new
	local Mouse = LocalPlayer.GetMouse(LocalPlayer)
	function ClosestChar()
		local Max, Close = math.huge
		for I,V in pairs(GetPlayers(Players)) do
			if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
				local Head = FindFirstChild(V.Character, "Head")
				if Head then
					local Pos, OnScreen = WTSP(Camera, Head.Position)
					if OnScreen then
						local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
						if Dist < Max then
							Max = Dist
							Close = V.Character
						end
					end
				end
			end
		end
		return Close
	end
	
	local MT = getrawmetatable(game)
	local __namecall = MT.__namecall
	setreadonly(MT, false)
	MT.__namecall = newcclosure(function(self, ...)
		local Method = getnamecallmethod()
		if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
			local Character = ClosestChar()
			if Character then
				return Character.Head, Character.Head.Position
			end
		end
	
		return __namecall(self, ...)
	end)
	setreadonly(MT, true)
	
	end)
--ESP
local ESPEnabled = false
local DistanceEnabled = false
local TracersEnabled = false

pcall(function()
	
	Camera = game:GetService("Workspace").CurrentCamera
	RunService = game:GetService("RunService")
	camera = workspace.CurrentCamera
	Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

	function GetPoint(vector3)
		local vector, onScreen = camera:WorldToScreenPoint(vector3)
		return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
	end
	
	function MakeESP(model)
		local CurrentParent = model.Parent
	
		local TopL = Drawing.new("Line")
		local BottomL = Drawing.new("Line")
		local LeftL = Drawing.new("Line")
		local RightL = Drawing.new("Line")
		local Tracer = Drawing.new("Line")
		local Display = Drawing.new("Text")

        coroutine.resume(coroutine.create(function()
			while model.Parent == CurrentParent do
				
				local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
                local GetP = GetPoint(model.Head.Position)
                local headps = model.Head.CFrame
                
				if ESPEnabled and GetP[2] then
					
                    -- Calculate Cords
                    local topright = headps * CFrame.new(3,0.5, 0)
                    local topleft = headps * CFrame.new(-3,0.5, 0)
                    local bottomleft = headps * CFrame.new(-3,-7,0)
                    local bottomright = headps * CFrame.new(3,-7,0)
					topright = GetPoint(topright.p)[1]
					topleft = GetPoint(topleft.p)[1]
					bottomleft = GetPoint(bottomleft.p)[1]
					bottomright = GetPoint(bottomright.p)[1]

                    local teamcolor = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                    TopL.Color, BottomL.Color, RightL.Color, LeftL.Color = teamcolor, teamcolor, teamcolor, teamcolor
                    TopL.From, BottomL.From, RightL.From, LeftL.From = topleft, bottomleft, topright, topleft
                    TopL.To, BottomL.To, RightL.To, LeftL.To = topright, bottomright, bottomright, bottomleft
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = true, true, true, true
				else
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = false, false, false, false
                end
                
				if ESPEnabled and TracersEnabled and GetP[2] then
					Tracer.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
					Tracer.From = Bottom
					Tracer.To = GetPoint(headps.p)[1]
					Tracer.Thickness = 1.5
					Tracer.Visible = true
				else
					Tracer.Visible = false
                end
                
				if ESPEnabled and DistanceEnabled and GetP[2] then
					Display.Visible = true
					Display.Position = GetPoint(headps.p + Vector3.new(0,0.5,0))[1]
					Display.Center = true
					Display.Text = tostring(math.floor(Distance)).." studs"
				else
					Display.Visible = false
                end
                
				RunService.RenderStepped:Wait()
			end
	
			TopL:Remove()
			BottomL:Remove()
			RightL:Remove()
			LeftL:Remove()
			Tracer:Remove()
			Display:Remove()
        
        end))
    end
    
	for _, Player in next, game:GetService("Players"):GetChildren() do
		if Player.Name ~= game.Players.LocalPlayer.Name then
			MakeESP(Player.Character)
			Player.CharacterAdded:Connect(function()
				delay(0.5, function()
					MakeESP(Player.Character)
				end)
			end)
		end	
	end
	
	game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            delay(0.5, function()
                MakeESP(player.Character)
            end)
		end)
	end)
	
end)

-- Enables/Disables ESP. Main toggle
bFolder4:Toggle( "Enabled", function(value)
    ESPEnabled = value
end)

-- Toggles tracers
bFolder4:Toggle( "Tracers", function(value)
    TracersEnabled = value
end)

-- Toggles distance display
bFolder4:Toggle( "Distance Display", function(value)
    DistanceEnabled = value
end)

--g--
--Speed
gFolder:Slider("Walkspeed",{
    min = 16; 
    max = 250; 
    precise = true; 
},function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
--Jumpower
gFolder2:Slider("JumpPower ",{
    min = 16; 
    max = 250; 
    precise = true; 
},function(e)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = e
end)
--Invisible
gFolder3:Button("Invisible",function()
    local plr = game.Players.LocalPlayer
local char = plr.Character
local lleg = char:FindFirstChild("Left Leg")
local rleg = char:FindFirstChild("Right Leg")
local larm = char:FindFirstChild("Left Arm")
local rarm = char:FindFirstChild("Right Arm")
local torso = char:FindFirstChild("Torso")
local head = char:FindFirstChild("Head")
local face = char:FindFirstChild("Face")
head.Transparency = 1
torso.Transparency = 1
rarm.Transparency = 1
larm.Transparency = 1
lleg.Transparency = 1
rleg.Transparency = 1
end)
--Noclip
gFolder4:Button("Noclip",function()
	game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
	game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
	while true do
		game:GetService("RunService").Stepped:wait()
		game.Players.LocalPlayer.Character.Head.CanCollide = false
		game.Players.LocalPlayer.Character.Torso.CanCollide = false
	end	
end)
