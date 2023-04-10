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

Variables.Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
Variables.Window = Variables.Library:CreateWindow({
    Name = "Greezy Hub",
    LoadingTitle = "Greezy Development",
    LoadingSubtitle = "by Greezy",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "GreezyHub", -- Create a custom folder for your hub/game
       FileName = "greezyhub"
    },
    Discord = {
       Enabled = true,
       Invite = "a7V6C4dAQj", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Greezy Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/a7V6C4dAQj)",
       FileName = "GreezyHubKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "1234"
    }
})

Variables.CatchingTab = Variables.Window:CreateTab("Catching")
Variables.SwattingTab = Variables.Window:CreateTab("Swatting")
Variables.Physics = Variables.Window:CreateTab("Physics")
Variables.Kicking = Variables.Window:CreateTab("Kicking")
-- // Bootup

local MagSection = Variables.CatchingTab:CreateSection("Mags", false)
local Button = MagSection:CreateButton({
    Name = "Button Example",
    Info = "Button info/Description.", -- Speaks for itself, Remove if none.
    Interact = 'Changable',
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})

-- Variables.Mags = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Catching/Mags.lua"))()
-- Variables.Grapher = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Catching/Graphing.lua"))()
-- Variables.Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Kicking/Aimbot.lua"))()
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