local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DongHubX | DongTatKaiMarHg",
   LoadingTitle = "Đang tải DongHubX...",
   LoadingSubtitle = "by Dong Scripter",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DongHubConfig",
      FileName = "MainHub"
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Auto Farm", 4483362458)

_G.AutoFarm = false
MainTab:CreateToggle({
   Name = "Auto Farm (chưa hoàn thiện)",
   CurrentValue = false,
   Flag = "AutoFarmToggle", 
   Callback = function(Value)
      _G.AutoFarm = Value
      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
         end
      end)
   end,
})

local PlayerTab = Window:CreateTab("Người Chơi", 4483345998)

PlayerTab:CreateSlider({
   Name = "Tốc độ chạy (Speed)",
   Range = {16, 500},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSlider({
   Name = "Nhảy cao (Jump)",
   Range = {50, 500},
   Increment = 1,
   Suffix = " Power",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local MiscTab = Window:CreateTab("Tiện ích", 4483345998)

MiscTab:CreateButton({
   Name = "Đóng Menu (Destroy)",
   Callback = function()
      Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "DongHubX Đã Bật!",
   Content = "Chúc bạn trải nghiệm vui vẻ trên script Dongxanhdeptrai",
   Duration = 5,
   Image = 4483345998,

})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function ApplyESP(player)
    local function CreateHighlight(character)
        task.wait(0.1)
        if character:FindFirstChild("ESP_Highlight") then
            character.ESP_Highlight:Destroy()
        end

        local highlight = Instance.new("Highlight")
        highlight.Name = "ESP_Highlight"
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end

    if player.Character then
        CreateHighlight(player.Character)
    end
    player.CharacterAdded:Connect(CreateHighlight)
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        ApplyESP(player)
    end
end

Players.PlayerAdded:Connect(ApplyESP)

