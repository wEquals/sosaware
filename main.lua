local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
local aimbot = loadstring(game:HttpGet'https://github.com/RunDTM/Zeerox-Aimbot/raw/main/library.lua')()
local hum = game.Players.LocalPlayer.Character.Humanoid
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/wEquals/Solaris-Hub/main/testing.lua'),true))()
espLib:Load()

ESP.TeamMates = false
aimbot.Key = Enum.UserInputType.MouseButton2 -- aimbot key
aimbot.Smoothing = 0 -- aimbot smoothness
aimbot.Offset = {0, 0} -- offset for aimbot
aimbot.Players = true -- is aimbot for default player characters enabled
aimbot.PlayerPart = 'Head' -- part of default player character to aim
aimbot.InvisibleCheck = false


local Window = Rayfield:CreateWindow({
	Name = "sosaWare",
	LoadingTitle = "sosaWare initializing..",
	LoadingSubtitle = "by sosaWare dev team",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "sosawre CFG",
		FileName = "CFG1"
	},
	KeySystem = true, -- Set this to true to use their key system
	KeySettings = {
		Title = "sosaWare",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/3Px6TDU2)",
		SaveKey = true,
		Key = "sosaware" or "hi"
	}
})

Rayfield:Notify({
	Title = "Sosa-Ware",
	Content = "Successfully Injected",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
	   Ignore = {
		  Name = "Ignore",
		  Callback = function()
	   end
	},
 },
 })

local Tab = Window:CreateTab("Aimbot", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Aimbot Settings")

local Toggle = Tab:CreateToggle({
	Name = "Enable Aimlock",
	CurrentValue = false,
	Flag = "Aimlock", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.Enabled = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Invisible check",
	CurrentValue = false,
	Flag = "Aimlock", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.InvisibleCheck = Value
	end,
})

local Dropdown = Tab:CreateDropdown({
	Name = "HitPart",
	Options = {"Random Upper Body", "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"} ,
	CurrentOption = "Head",
	Flag = "HitPart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
	 if Option == "Random Upper Body" then
			 local RandomParts = {
				 "Head";
				 "Torso";
				 "Right Arm";
				 "Left Arm";
				 -- this should work, how it works is it picks a random hitpart in the list above with math.random then it will put that part in AimPart and it'll aim at that exact part.
		 
				 -- more room for more parts
				 }
				 function garbagetalking()
				 while aimbot.PlayerPart == "Random Upper Body" do
					 RandomParts[math.random(1,#RandomParts)]()
					 aimbot.PlayerPart = math.random(1,#RandomParts)
					   end
				 end
	elseif Option == "Head" then
		 aimbot.PlayerPart = "Head"
	 elseif Option == "Torso" then
		 aimbot.PlayerPart = "Torso"
	 elseif Option == "Left Arm" then
		 aimbot.PlayerPart = "Left Arm"
	 elseif Option == "Right Arm" then
		 aimbot.PlayerPart = "Right Arm"
	 elseif Option == "Left Leg" then
		 aimbot.PlayerPart = "Left Leg"
	 elseif Option == "Right Leg" then
		 aimbot.PlayerPart = "Right Leg"
	 end
	end,
 })

 local Dropdown = Tab:CreateDropdown({
	Name = "Aimbot Key",
	Options = {"F1","F2","F3","E","Right Mouse Button","Left Mouse Button","Scroll Wheel","Shift"},
	CurrentOption = "Right Mouse Button",
	Flag = "HitKeY", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		print("Option")
		if Option == "F1" then
			aimbot.Key = Enum.KeyCode.F1
		elseif Option == "F2" then
			aimbot.Key = Enum.KeyCode.F2
		elseif Option == "F3" then
			aimbot.Key = Enum.KeyCode.F3
		elseif Option == "E" then
			aimbot.Key = Enum.KeyCode.E
		elseif Option == "Right Mouse Button" then
			aimbot.Key = Enum.UserInputType.MouseButton2
		elseif Option == "Left Mouse Button" then
			aimbot.Key = Enum.UserInputType.MouseButton1
		elseif Option == "Shift" then
			aimbot.Key = Enum.UserInputType.Shift
		elseif Option == "Scroll Wheel" then
			aimbot.Key = Enum.UserInputType.MouseWheel
		end
	end,
 })

local Slider = Tab:CreateSlider({
	Name = "Smoothing",
	Range = {0, 80},
	Increment = 1,
	Suffix = "Smoothing",
	CurrentValue = 0,
	Flag = "Smoothing", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.Smoothing = Value
    end,
})


local Toggle = Tab:CreateToggle({
	Name = "Enable Teamcheck",
	CurrentValue = false,
	Flag = "TeamCheck", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.TeamCheck = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Alive Check",
	CurrentValue = false,
	Flag = "AliveCheck", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.AliveCheck = Value
	end,
})


local Paragraph = Tab:CreateParagraph({Title = "FOV Settings", Content = "Everything below is FOV settings"})

local Toggle = Tab:CreateToggle({
	Name = "FOV Circle",
	CurrentValue = false,
	Flag = "EnableFOV", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.ShowFOV = Value
	end,
})

local Slider = Tab:CreateSlider({
	Name = "FOV Size",
	Range = {0, 300},
	Increment = 10,
	Suffix = "FOV",
	CurrentValue = 50,
	Flag = "FOVSize", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.FOV = Value
    end,
})

local ColorPicker = Tab:CreateColorPicker({
    Name = "FOV Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "FOVCircleColour", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		aimbot.FOVCircleColor = Value
    end,
}) 

local Tab = Window:CreateTab("ESP", 4483362458) -- Title, Image
local Section = Tab:CreateSection("ESP Settings")

local Toggle = Tab:CreateToggle({
	Name = "Enable ESP",
	CurrentValue = false,
	Flag = "ESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ESP:Toggle(Value)
	end,
})

local ColorPicker = Tab:CreateColorPicker({
    Name = "Box ESP Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ESPColour", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        ESP.Color = Value
    end
}) 

local Paragraph = Tab:CreateParagraph({Title = "Misc ESP Settings", Content = "Everything below is Misc ESP settings"})

local Toggle = Tab:CreateToggle({
	Name = "Disable Team Check",
	CurrentValue = false,
	Flag = "TeamCheckESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			ESP.TeamMates = false
		else
			ESP.TeamMates = true
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Names ESP",
	CurrentValue = true,
	Flag = "Names", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ESP.Names = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Tracers ESP",
	CurrentValue = false,
	Flag = "Tracers", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ESP.Tracers = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Chams ESP",
	CurrentValue = false,
	Flag = "Chams", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		espLib.options.chams = Value
	end,
})

local ColorPicker = Tab:CreateColorPicker({
    Name = "Chams Colour",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ChamsColour", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		espLib.options.chamsFillColor = Value
    end
})

local Toggle = Tab:CreateToggle({
	Name = "Out of view arrows",
	CurrentValue = false,
	Flag = "Arrows", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        espLib.options.outOfViewArrows = Value
	end,
})


local Tab = Window:CreateTab("Silent Aim", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Silent Aim Settings")
local Paragraph = Tab:CreateParagraph({Title = "WIP", Content = "Work In Progress"})


local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Misc Settings")

local Button = Tab:CreateButton({
	Name = "Destroy UI",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local Paragraph = Tab:CreateParagraph({Title = "Fun Scripts", Content = "Everything below is fun scripts"})

local Button = Tab:CreateButton({
	Name = "Kill All",
	Callback = function()
		local damage = 100
		local pname = game.Players.LocalPlayer.Name
		Players = game:GetService("Players")
		for i, player in pairs(Players:GetPlayers()) do
		if player.Name ~= pname then
		local tbl_main =
		{
		  game:GetService("Workspace")[player.Name].Humanoid,
		  damage,
		  0,
		  0
		}
		game:GetService("ReplicatedStorage")["ACS_Engine"].Eventos.Damage:FireServer(unpack(tbl_main))
		end
		end
	end,
})

local Button = Tab:CreateButton({
	Name = "Click to Kill",
	Callback = function()
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()
		mouse.Button1Down:connect(function()
		local mT = mouse.Target
		local dead = mT.Parent
		local damage = 100
		print(mT)
		if dead.ClassName == "Model" then
		local tbl_main =
		{
		  game:GetService("Workspace")[dead.Name].Humanoid,
		  damage,
		  0,
		  0
		}
		game:GetService("ReplicatedStorage")["ACS_Engine"].Eventos.Damage:FireServer(unpack(tbl_main))
		else
		if mT.Name == "Handle" then
		local tbl_main =
		{
		  game:GetService("Workspace")[dead.Parent.Name].Humanoid,
		  damage,
		  0,
		  0
		}
		game:GetService("ReplicatedStorage")["ACS_Engine"].Eventos.Damage:FireServer(unpack(tbl_main))
		end
		end
		end)		
	end,
})

local Button = Tab:CreateButton({
	Name = "Click to TP",
	Callback = function()
		local Plr = game:GetService("Players").LocalPlayer

		local Mouse = Plr:GetMouse()
		
		 
		
		Mouse.Button1Down:connect(function()
		
		if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
		
		if not Mouse.Target then return end
		
		Plr.Character:MoveTo(Mouse.Hit.p)
		
		end)
	end,
})

local Button = Tab:CreateButton({
	Name = "ACS DDOS",
	Callback = function()
		while true do
			for i=1,10 do
			game.ReplicatedStorage.ACS_Engine.Events.ServerBullet:FireServer(Vector3.new(0/0/0),Vector3.new(0/0/0))
			end
			task.wait()
		 end
	end,
})

local Paragraph = Tab:CreateParagraph({Title = "Fun Scripts", Content = "Everything below is fun scripts"})

local Slider = Tab:CreateSlider({
	Name = "Walk Speed",
	Range = {0, 200},
	Increment = 2,
	Suffix = "Walk Speed",
	CurrentValue = 16,
	Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		hum.WalkSpeed = Value
    end,
})



local Button = Tab:CreateButton({
	Name = "Lean Gun",
	Callback = function()
Blacklisted = {"Flame", "SightMark", "SightMark2A", "Tip", "Trigger"}

workspace.CurrentCamera.DescendantAdded:Connect(function(O)
    if O:IsA("BasePart") and not table.find(Blacklisted, O.Name) then
        spawn(function()
            while wait() do
                O.Color = Color3.fromRGB(148,0,211)
                O.Transparency = 0.6
                O.Material = Enum.Material.ForceField
            end
        end)
    end
end)
	end,
 })
 --loading configuration
Rayfield:LoadConfiguration()
