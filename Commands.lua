print('[SYSTEM/ CMD]: '..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name..' uses ModMate! 🤯 💕')

local module = {
	
	{
		Name = "kill",
		Description = "Kill the player",
		Active = true,
		Args = {"Target"},
		Function = function(speaker, args)
			local targetPlayer
			
			if args[1] == "all" or args[1] == "everyone" then
				targetPlayer = game:GetService('Players'):GetPlayers()
			elseif args[1] == "me" then
				targetPlayer = speaker.Character
			else
				targetPlayer = game:GetService('Players'):FindFirstChild(args[1])
			end
			
			if targetPlayer then
				if type(targetPlayer) == "table" then
					for _, player in ipairs(targetPlayer) do
						local Character = player.Character
						if Character then
							Character:BreakJoints()
						end
					end
				else
					local Character = targetPlayer
					if Character then
						Character:BreakJoints()
					end
				end
			end
		end,
	},
	
	{
		Name = "sethealth",
		Description = "Sets the player's health to your liking",
		Active = true,
		Args = {"Target", "Value"},
		Function = function(speaker, args)
			local targetPlayer
			
			if args[1] == "all" or args[1] == "everyone" then
				targetPlayer = game:GetService('Players'):GetPlayers()
			elseif args[1] == "me" then
				targetPlayer = {speaker}
			else
				targetPlayer = {game:GetService('Players'):FindFirstChild(args[1])}
			end
			
			local healthValue = tonumber(args[2])
			
			for _, player in ipairs(targetPlayer) do
				local Character = player.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
				
				if Character and Humanoid and healthValue then
					Humanoid.Health = healthValue
				end
			end
		end,
	},
	
	{
		Name = "freeze",
		Description = "Freezes the player on the spot",
		Active = true,
		Function = function(speaker, args)
			local targetPlayer
			
			if args[1] == "all" or args[1] == "everyone" then
				targetPlayer = game:GetService('Players'):GetPlayers()
			elseif args[1] == "me" then
				targetPlayer = {speaker}
			else
				targetPlayer = {game:GetService('Players'):FindFirstChild(args[1])}
			end
			
			for _, player in ipairs(targetPlayer) do
				local Character = player.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				
				if Character and HumanoidRootPart then
					HumanoidRootPart.Anchored = true
				end
			end
		end,
	},
	
	{
		Name = "unfreeze",
		Description = "Unfreezes the player",
		Active = true,
		Function = function(speaker, args)
			local targetPlayer
			
			if args[1] == "all" or args[1] == "everyone" then
				targetPlayer = game:GetService('Players'):GetPlayers()
			elseif args[1] == "me" then
				targetPlayer = {speaker}
			else
				targetPlayer = {game:GetService('Players'):FindFirstChild(args[1])}
			end
			
			for _, player in ipairs(targetPlayer) do
				local Character = player.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				
				if Character and HumanoidRootPart then
					HumanoidRootPart.Anchored = false
				end
			end
		end,
	},
}

return module
