local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
local aimbot = loadstring(game:HttpGet("https://github.com/RunDTM/Zeerox-Aimbot/raw/main/library.lua"))()
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

local sosa = {
    Blatant = {
        CFrame = {
            Enabled = nil,
            Value = nil
        },
        FakeLag = {
            Enabled = nil,
            Duration = nil
        },
    },
    Visuals = {
        Local = {
            Chams = nil,
            Highlight = {
                Enabled = nil,
                FillColor = nil,
                OutlineColor = nil,
            },
            CloneChams = {
                Enabled = nil,
                Duration = nil,
                Color = nil,
                Material = nil
            }
        },
    }
}

local Window = Rayfield:CreateWindow({
	Name = "sosaware",
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
		Key = "sosaware"
	}
})

Rayfield:Notify({
	Title = "Sosa-Ware",
	Content = "Successfully Injected",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
	   Ignore = {
		  Name = "Okay!",
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
	Name = "Visible Check",
	CurrentValue = false,
	Flag = "VisibleCheck", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		aimbot.VisibilityCheck = Value
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
	Name = "Team Check",
	CurrentValue = false,
	Flag = "TeamCheckESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			ESP.TeamMates = true
		else
			ESP.TeamMates = false
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Misc Information",
	CurrentValue = true,
	Flag = "MiscInformation", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ESP.Names = Value
	end,
})

local Button = Tab:CreateButton({
	Name = "Radar",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/PlayerRadar.lua"))()
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

local Tab = Window:CreateTab("Visuals", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Visual Settings")

local Toggle = Tab:CreateToggle({
	Name = "Chams",
	CurrentValue = false,
	Flag = "LocalChams", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        sosa.Visuals.Local.Chams = Value
	end,
})

task.spawn(function ()
	while true do
		wait()
		if sosa.Visuals.Local.Chams then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Material = "ForceField"
				end
			end
		else
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Material = "Plastic"
				end
			end
		end
	end
end)

local Toggle = Tab:CreateToggle({
	Name = "Highlight",
	CurrentValue = false,
	Flag = "LocalHighlight", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        sosa.Visuals.Local.Highlight.Enabled = Value
	end,
})

local LocalHL = Instance.new("Highlight")

task.spawn(function ()
    while true do
        wait()
        if sosa.Visuals.Local.Highlight.Enabled then
            LocalHL.Parent = LocalPlayer.Character
            LocalHL.FillColor = sosa.Visuals.Local.Highlight.FillColor
            LocalHL.OutlineColor = sosa.Visuals.Local.Highlight.OutlineColor
        else
            LocalHL.Parent = game.CoreGui
        end
    end
end)

local Toggle = Tab:CreateToggle({
	Name = "Clone Chams",
	CurrentValue = false,
	Flag = "CloneLPChams", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        sosa.Visuals.Local.CloneChams.Enabled = Value
	end,
})

task.spawn(function ()
    while true do
        wait()
        if sosa.Visuals.Local.CloneChams.Enabled then
            repeat
                game.Players.LocalPlayer.Character.Archivable = true
                local Clone = game.Players.LocalPlayer.Character:Clone()
                for _,Obj in next, Clone:GetDescendants() do
                if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                    Obj:Destroy()
                elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                    if Obj.Transparency == 1 then
                    Obj:Destroy()
                    else
                    Obj.CanCollide = false
                    Obj.Anchored = true
                    Obj.Material = sosa.Visuals.Local.CloneChams.Material
                    Obj.Color = sosa.Visuals.Local.CloneChams.Color
                    Obj.Transparency = 0
                    Obj.Size = Obj.Size + Vector3.new(0.03, 0.03, 0.03)   
                end
            end
                pcall(function()
                    Obj.CanCollide = false
                end)
            end
            Clone.Parent = game.Workspace
            wait(sosa.Visuals.Local.CloneChams.Duration)
            Clone:Destroy()  
            until sosa.Visuals.Local.CloneChams.Enabled == false
        end
    end
end)

local Slider = Tab:CreateSlider({
	Name = "Clone Cham Duration",
	Range = {0, 100},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Flag = "ChamDuration", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		sosa.Visuals.Local.CloneChams.Duration = Value
	end,
 })

 local Dropdown = Tab:CreateDropdown({
	Name = "Clone Cham Material",
	Options = {'Neon', 'ForceField', 'Plastic'},
	CurrentOption = "Option 1",
	Flag = "ChamMaterial", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		sosa.Visuals.Local.CloneChams.Material = Option
	end,
 })

	local Section = Tab:CreateSection("Visual Colours")




local Tab = Window:CreateTab("Silent Aim", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Silent Aim Settings")
local Paragraph = Tab:CreateParagraph({Title = "WIP", Content = "Work In Progress"})

local Toggle = Tab:CreateToggle({
	Name = "Enable Silent Aim",
	CurrentValue = false,
	Flag = "Silent", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        local enabled = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Enable FOV Circle",
	CurrentValue = false,
	Flag = "FOVSilentAim", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Drawing.new("Circle")
	end,
})

local Slider = Tab:CreateSlider({
	Name = "FOV Size",
	Range = {0, 100},
	Increment = 10,
	Suffix = "",
	CurrentValue = 10,
	Flag = "SilentAimFOVSize", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		local fov = Value
	end,
 })

local Dropdown = Tab:CreateDropdown({
   Name = "Hit Part",
   Options = {"Head","Random"},
   CurrentOption = "Head",
   Flag = "SilentAimHitPart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
	if Option == "Head" then
		getfenv().lock = "Head"
	elseif Option == "Random" then
		getfenv().lock = "Random"
	end
   end,
})

local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Misc Settings")

local Toggle = Tab:CreateToggle({
	Name = "Rainbow Colours",
	CurrentValue = false,
	Flag = "RainbowColours", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			spawn(function()
				while wait() do
					aimbot.FOVCircleColor = Color3.fromHSV((tick() % 5 / 5), 1, 1)
					espLib.options.boxesColor = Color3.fromHSV((tick() % 5 / 5), 1, 1)
					espLib.options.chamsFillColor = Color3.fromHSV((tick() % 5 / 5), 1, 1)
					espLib.options.tracerColor = Color3.fromHSV((tick() % 5 / 5), 1, 1)
					espLib.options.healthBarsColor = Color3.fromHSV((tick() % 5 / 5), 1, 1)
					ESP.Color = Color3.fromHSV((tick() % 5 / 5), 1, 1)
				end
			end)
		end
	end,
})

local Button = Tab:CreateButton({
	Name = "Destroy UI",
	Callback = function()
		Rayfield:Destroy()
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
