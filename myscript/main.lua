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
