getgenv().Variables = {}

Variables.State = "undefined";
Variables.Players = game:GetService("Players")
Variables.ReplicatedStorage = game:GetService("ReplicatedStorage")
Variables.UserInputService = game:GetService("UserInputService")
Variables.Client = Variables.Players.LocalPlayer
Variables.Character = Variables.Client.Character or Variables.Client.CharacterAdded:Wait()

Variables.Client.CharacterAdded:Connect(function(Character)
    Variables.Character = Character 
end)

Variables.Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
Variables.Window = Rayfield:CreateWindow({
	Name = "Greezy Hub",
	LoadingTitle = "Greezy Development",
	LoadingSubtitle = "by Greezy",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Greezy Development",
		FileName = "Greezy Hub"
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Greezy Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/a7V6C4dAQj)",
		SaveKey = true,
		Key = "a7V6C4dAQj"
	}
})

Variables.CatchingTab = Variables.Window:CreateTab("Catching")
Variables.SwattingTab = Variables.Window:CreateTab("Swatting");
Variables.Physics = Variables.Window:CreateTab("Physics")
Variables.Kicking = Variables.Window:CreateTab("Kicking")
-- // Bootup

Variables.Mags = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Catching/Mags.lua"))()
Variables.Grapher = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Catching/Grapher.lua"))()
Variables.Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Kicking/Aimbot.lua"))()
--Variables.Boost = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Physics/Boost.lua"))()
--Variables.DynamicJump = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Physics/DynamicJump.lua"))()
--Variables.Tracer = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Catching/Tracer.lua"))()

local old; old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...};

    if (args[2] == "swat" or args[2] == "catch ") and string.lower(getnamecallmethod()) == "fireserver" then
        Variables.State = args[2] == "swat" and args[2] or "catch";
    end

    return old(self, ...);
end))