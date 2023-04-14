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

Variables.Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()

-- Build main UI

Variables.Window = Variables.Library.new("Greezy Hub", "v0.5.0", 4370345701)

Variables.CatchingTab = Variables.Window.Tab("Catching")
Variables.SwattingTab = Variables.Window.Tab("Swatting")
Variables.Physics = Variables.Window.Tab("Physics")
Variables.Kicking = Variables.Window.Tab("Kicking")

-- Bootup

-- Variables.Mags = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Catching/Mags.lua"))()
-- Variables.Grapher = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Catching/Graphing.lua"))()
-- Variables.Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/itstylerrr/GreezyHub/main/FootballFusion2/Modules/Kicking/Aimbot.lua"))()
-- Variables.Boost = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Physics/Boost.lua"))()
-- Variables.DynamicJump = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Physics/DynamicJump.lua"))()
-- Variables.Tracer = loadstring(game:HttpGet("https://raw.githubusercontent.com/yoo123fd/f/master/Modules/Catching/Tracer.lua"))()

local old; old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...};

    if (args[2] == "swat" or args[2] == "catch ") and string.lower(getnamecallmethod()) == "fireserver" then
        Variables.State = args[2] == "swat" and args[2] or "catch";
    end

    return old(self, ...);
end))