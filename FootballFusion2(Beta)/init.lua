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

Variables.Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/StepBroFurious/Script/main/HydraHubUi.lua'))()

-- Build main UI

Variables.Window = Variables.Library.new("Greezy Hub", game.Players.LocalPlayer.UserID, "v0.5.6")

Variables.CatchingTab = Variables.Window:Category("Catching", "http://www.roblox.com/asset/?id=6023426915")
Variables.SwattingTab = Variables.Window:Category("Swatting", "http://www.roblox.com/asset/?id=6023426915")
Variables.Physics = Variables.Window:Category("Physics", "http://www.roblox.com/asset/?id=6023426915")
Variables.Kicking = Variables.Window:Category("Kicking", "http://www.roblox.com/asset/?id=6023426915")

Variables.CatchingLabel = Variables.CatchingTab:Button("Magging", "http://www.roblox.com/asset/?id=8395747586")
Variables.MagToggle = Variables.CatchingLabel:Toggle({
    Title = "Toggle Mags",
    Description = "",
    Default = false
    }, function(value)
    print("Mag Toggle:")
    print(value)
end)
Variables.MagSlider = Variables.CatchingTab:Slider({
    Title = "Mag Distance",
    Description = "",
    Default = 7,
    Min = 1,
    Max = 40
    }, function(value)
    print("Mag Distance:")
    print(value)
end)

Variables.GraphingLabel = Variables.CatchingTab:Button("Graphing", "http://www.roblox.com/asset/?id=8395747586")
Variables.GraphingToggle = Variables.CatchingLabel:Toggle({
    Title = "Toggle Graphing",
    Description = "",
    Default = false
    }, function(value)
    print("Graphing Toggle:")
    print(value)
end)

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