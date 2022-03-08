local DiscordLib =
    loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

local win = DiscordLib:Window("paper hub")

local serv = win:Server("script", "")

local btns = serv:Channel("main")

 getgenv().toggle = true

btns:Toggle(
    "auto collect orbs/bags",
    function()

        while task.wait() do
            if getgenv().toggle == true then
                spawn(function()
                    for i,v in pairs(game:GetService("Workspace")["__THINGS"].Lootbags:GetChildren()) do
                        if i > 0 then
                            spawn(function()
                                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            end)
                        end
                    end
                end)
                
                for i,v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
                    if i > 0 then
                        spawn(function()
                            local args = {
                                [1] = {
                                    [1] = {
                                        [1] = v.Name
                                    }
                                }
                            }
                            workspace.__THINGS.__REMOTES:FindFirstChild("claim orbs"):FireServer(unpack(args))    
                        end)
                    end
                end
                
            end
        end
        DiscordLib:Notification("Notification", "Auto Collecting Orbs and Loot Bags", "Okay!")
    end
)


local sldrs = serv:Channel("local player")

local sldr =
    sldrs:Slider(
    "walkspeed",
    0,
    1000,
    400,
    function(t)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
    end
)

local sldrs =
    sldrs:Slider(
    "jump power",
     0,
     1000,
     400,
     function(v)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
     end
 )

local creds = serv:Channel("credits")

creds:Label(
    "UI Lib by dawid#7205"
)

creds:Label(
    "add my discord Paper#7042"
)

win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")

