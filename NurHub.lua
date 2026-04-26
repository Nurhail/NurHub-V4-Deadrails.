-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- CLEANUP OLD GUI
pcall(function()
    player.PlayerGui:FindFirstChild("NeonGUI"):Destroy()
end)

-- THEME
local themeColor = Color3.fromRGB(0, 255, 0) -- Neon Green

-- STYLING FUNCTION
local function neonStyle(ui)
    ui.BackgroundColor3 = Color3.fromRGB(10,10,10)
    if ui:IsA("TextButton") then
        ui.TextColor3 = themeColor
        ui.Font = Enum.Font.GothamMedium
        ui.TextSize = 14
    end
    local stroke = Instance.new("UIStroke", ui)
    stroke.Color = themeColor
    stroke.Thickness = 1
end

-- GUI ROOT --
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NeonGUI"
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999

-- ICON "N" --
local openBtn = Instance.new("TextButton", gui)
openBtn.Name = "OpenIcon"
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 15, 0.5, -25)
openBtn.Visible = false
openBtn.Text = "N"
openBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
openBtn.BackgroundTransparency = 0.4
openBtn.TextColor3 = themeColor
openBtn.TextTransparency = 0.2
openBtn.TextSize = 25
openBtn.Font = Enum.Font.GothamBold
openBtn.Active = true
openBtn.Draggable = true
openBtn.ZIndex = 10

local iconCorner = Instance.new("UICorner", openBtn)
iconCorner.CornerRadius = UDim.new(0, 12)

local iconStroke = Instance.new("UIStroke", openBtn)
iconStroke.Color = themeColor
iconStroke.Thickness = 2.5
iconStroke.Transparency = 0.3
iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- MAIN FRAME --
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 420)
frame.Position = UDim2.new(0.5, -160, 0.5, -210)
frame.Active = true
frame.Draggable = true
frame.BackgroundColor3 = Color3.fromRGB(5,5,5)
frame.ZIndex = 5
frame.Visible = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 8)

local frameStroke = Instance.new("UIStroke", frame)
frameStroke.Color = themeColor
frameStroke.Thickness = 2

-- TITLE --
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "NURHUB MOD MENU"
title.Font = Enum.Font.GothamMedium
title.TextSize = 16
title.TextColor3 = themeColor
title.BackgroundTransparency = 1
title.ZIndex = 6

-- CLOSE BUTTON --
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, 5, 0, 5)
closeBtn.Text = "X"
closeBtn.ZIndex = 7
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)

local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 6)
neonStyle(closeBtn)

-- MINIMIZE BUTTON --
local miniBtn = Instance.new("TextButton", frame)
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.Text = "-"
miniBtn.ZIndex = 7

local miniCorner = Instance.new("UICorner", miniBtn)
miniCorner.CornerRadius = UDim.new(0, 6)
neonStyle(miniBtn)

-- SCROLLING FRAME --
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0, 10, 0, 45)
scroll.Size = UDim2.new(1, -20, 1, -55)
scroll.ScrollBarImageColor3 = themeColor
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ZIndex = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 280)

-- INFO LABEL --
local infoLabel = Instance.new("TextLabel", scroll)
infoLabel.Size = UDim2.new(0, 280, 0, 50)
infoLabel.Position = UDim2.new(0.5, -140, 0, 10)
infoLabel.Text = "⚠️ Sorry V4 is out of date\nNew script Nurhub V5"
infoLabel.Font = Enum.Font.GothamMedium
infoLabel.TextSize = 12
infoLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
infoLabel.BackgroundTransparency = 1
infoLabel.TextWrapped = true
infoLabel.ZIndex = 7

-- DISCORD BUTTON --
local discordBtn = Instance.new("TextButton", scroll)
discordBtn.Size = UDim2.new(0, 260, 0, 45)
discordBtn.Position = UDim2.new(0.5, -130, 0, 70)
discordBtn.Text = "💬 JOIN DISCORD"
discordBtn.ZIndex = 7

local discordCorner = Instance.new("UICorner", discordBtn)
discordCorner.CornerRadius = UDim.new(0, 8)
neonStyle(discordBtn)
discordBtn.TextColor3 = Color3.fromRGB(114, 137, 218) -- Discord Blue/Purple
discordBtn.TextSize = 14

-- DISCORD LINK --
local discordLink = "https://discord.gg/8D5Dug4Xn"

discordBtn.MouseButton1Click:Connect(function()
    setclipboard(discordLink)
    
    -- Visual feedback
    local originalText = discordBtn.Text
    discordBtn.Text = "✅ LINK COPIED!"
    discordBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
    
    task.wait(1.5)
    discordBtn.Text = originalText
    discordBtn.TextColor3 = Color3.fromRGB(114, 137, 218)
end)

-- COPY BUTTON --
local copyBtn = Instance.new("TextButton", scroll)
copyBtn.Size = UDim2.new(0, 260, 0, 40)
copyBtn.Position = UDim2.new(0.5, -130, 0, 125)
copyBtn.Text = "📋 COPY SCRIPT V5"
copyBtn.ZIndex = 7

local copyCorner = Instance.new("UICorner", copyBtn)
copyCorner.CornerRadius = UDim.new(0, 8)
neonStyle(copyBtn)
copyBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
copyBtn.TextSize = 14

-- SCRIPT TEXT TO COPY --
local scriptToCopy = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/Nurhail/NurHub-DeadRails/refs/heads/main/NurHub.lua'))()]]

-- COPY FUNCTION --
copyBtn.MouseButton1Click:Connect(function()
    setclipboard(scriptToCopy)
    
    -- Visual feedback
    local originalText = copyBtn.Text
    copyBtn.Text = "✅ COPIED!"
    copyBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
    
    task.wait(1)
    copyBtn.Text = originalText
end)

-- RUN BUTTON --
local runBtn = Instance.new("TextButton", scroll)
runBtn.Size = UDim2.new(0, 260, 0, 40)
runBtn.Position = UDim2.new(0.5, -130, 0, 175)
runBtn.Text = "🚀 RUN SCRIPT V5"
runBtn.ZIndex = 7

local runCorner = Instance.new("UICorner", runBtn)
runCorner.CornerRadius = UDim.new(0, 8)
neonStyle(runBtn)
runBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
runBtn.TextSize = 14

-- RUN FUNCTION --
runBtn.MouseButton1Click:Connect(function()
    runBtn.Text = "⏳ LOADING..."
    runBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
    
    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Nurhail/NurHub-DeadRails/refs/heads/main/NurHub.lua'))()
        end)
        if not success then
            warn("Error loading script: ", err)
            runBtn.Text = "❌ FAILED"
            runBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
            task.wait(1.5)
            runBtn.Text = "🚀 RUN SCRIPT V5"
            runBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
        end
    end)
    
    task.wait(1.5)
    if runBtn.Text == "⏳ LOADING..." then
        runBtn.Text = "🚀 RUN SCRIPT V5"
        runBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
    end
end)

-- OPEN/CLOSE LOGIC --
openBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    openBtn.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    openBtn.Visible = true
end)

-- MINIMIZE LOGIC --
local minimized = false
miniBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local goal = {Size = minimized and UDim2.new(0, 320, 0, 45) or UDim2.new(0, 320, 0, 420)}
    if not minimized then scroll.Visible = true end
    local t = TweenService:Create(frame, TweenInfo.new(0.3), goal)
    t:Play()
    t.Completed:Connect(function()
        if minimized then scroll.Visible = false end
    end)
    miniBtn.Text = minimized and "+" or "-"
end)

-- ADD DISCORD TEXT AT BOTTOM
local discordText = Instance.new("TextLabel", frame)
discordText.Size = UDim2.new(1, 0, 0, 25)
discordText.Position = UDim2.new(0, 0, 1, -25)
discordText.Text = "💬 discord.gg/8D5Dug4Xn"
discordText.Font = Enum.Font.GothamMedium
discordText.TextSize = 10
discordText.TextColor3 = Color3.fromRGB(114, 137, 218)
discordText.BackgroundTransparency = 1
discordText.ZIndex = 7

print("GUI Loaded Successfully!")
print("Join Discord: https://discord.gg/8D5Dug4Xn")
