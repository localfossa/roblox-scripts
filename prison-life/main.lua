if game.PlaceId == 155615604 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source", true))()

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local MarketplaceService = game:GetService("MarketplaceService")

	local Remote = ReplicatedStorage.meleeEvent

	local LocalPlayer = Players.LocalPlayer

	function getNearestPlayer(studs)
		local closest = nil
		local max_distance = studs or math.huge

		for _,v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer then
				if v.Character and v.Character.HumanoidRootPart then
					local distance = (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					if distance < max_distance then
						max_distance = distance
						closest = v
					end
				end
			end
		end
		return closest
	end

	local Window = Library:MakeWindow({
		Name = MarketplaceService:GetProductInfo(game.PlaceId).Name,
		HidePremium = true
	})

	local TabMain = Window:MakeTab({
		Name = "Main",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	TabMain:AddToggle({
		Name = "Toggle Killaura",
		Default = false,
		Color = Color3.fromRGB(77, 255, 77),
		Callback = function(Value)
			while Value do
				if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
					Remote:FireServer(getNearestPlayer())
					task.wait()
				end
			end
		end,
		Flag = "KillauraToggle"
	})

	LocalPlayer.Character.Humanoid.Died:Connect(function()
		if Library.Flags.KillauraToggle.Value == true then
			Library.Flags.KillauraToggle:Set(false)
		end
	end)

	Library:Init()
end
