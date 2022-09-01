if game.PlaceId == 8328351891 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source", true))()

	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local MarketplaceService = game:GetService("MarketplaceService")

	local LocalPlayer = Players.LocalPlayer

	function getCurrentTeam()
		local teams = {"Blue", "Green", "Red", "White", "Yellow", "Black"}
		local currentTeam = nil

		for _,v in pairs(teams) do
			if LocalPlayer.Name == tostring(Workspace["Zednov's Tycoon Kit"].Tycoons[v].Owner.Value) then
				currentTeam = v
			end
		end
		return currentTeam
	end

	function touchInterest(part)
		firetouchinterest(Players.LocalPlayer.Character.HumanoidRootPart, part, 0)
		task.wait()
		firetouchinterest(Players.LocalPlayer.Character.HumanoidRootPart, part, 1)
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
		Name = "Toggle Autocollect",
		Default = false,
		Color = Color3.fromRGB(77, 255, 77),
		Callback = function(Value)
			getgenv().autocollect = Value
			while getgenv().autocollect do
				touchInterest(Workspace["Zednov's Tycoon Kit"].Tycoons[getCurrentTeam()].Essentials.Giver)
			end
		end
	})

	Library:Init()
end
