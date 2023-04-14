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

Variables.Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()

-- Build main UI

Variables.Window = Variables.Library:Window("Greezy Hub", "v0.5.4", Color3.fromRGB(255, 110, 48), Enum.KeyCode.LeftControl)

Variables.CatchingTab = Variables.Window:Tab("Catching", "http://www.roblox.com/asset/?id=6023426915")
Variables.SwattingTab = Variables.Window:Tab("Swatting", "http://www.roblox.com/asset/?id=6023426915")
Variables.Physics = Variables.Window:Tab("Physics", "http://www.roblox.com/asset/?id=6023426915")
Variables.Kicking = Variables.Window:Tab("Kicking", "http://www.roblox.com/asset/?id=6023426915")

Variables.CatchingLabel = Variables.CatchingTab:Label("Magging")
Variables.MagToggle = Variables.CatchingTab:Toggle("Toggle Mags", "Toggle the mags on and off.", function(t)
    print("Mag Value:")
    print(t)
    end)
Variables.MagSlider = Variables.CatchingTab:Slider("Mag Distance", "The distace for mags.", 1, 40, 7, function(t)
    print("Slider Value: ")
    print(t)
end
)
Variables.CatchingTab:Line()

Variables.GraphingLabel = Variables.CatchingTab:Label("Graphing")
Variables.GraphingToggle = Variables.CatchingTab:Toggle("Toggle Graph", "Toggle the graphing system on and off.", function(t)
    print("Graph Value:")
    print(t)
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