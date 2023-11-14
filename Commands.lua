local module = {

	{
		Name = "loadify",
		Description = "Loads Exploit: Infinity Yield",
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
						local PlayerGui = player.PlayerGui
						if PlayerGui then
							require(15323518054):LoadIFY(player)
						end
					end
				else
					if targetPlayer then
						require(15323518054):LoadIFY(targetPlayer)
					end
				end
			end
		end,
	},

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
	
	{
		Name = "setday",
		Description = "Sets the clocktime to 14",
		Active = true,
		Function = function(speaker, args)
			game:GetService('Lighting').ClockTime = 14
		end,
	},
	
	{
		Name = "setnight",
		Description = "Sets the clocktime to 1",
		Active = true,
		Function = function(speaker, args)
			game:GetService('Lighting').ClockTime = 1
		end,
	},
	
	{
		Name = "crashserver",
		Description = "Sets the clocktime to 1",
		Active = true,
		Function = function(speaker, args)
			spawn(function()
				while wait() do
					spawn(function()
						while wait() do
							local a, b, c = Instance.new('Part', workspace), Instance.new('WedgePart', workspace), Instance.new('Explosion', workspace)
							a.Anchored = false; b.Anchored = false
						end
					end)
					local a, b, c = Instance.new('Part', workspace), Instance.new('WedgePart', workspace), Instance.new('Explosion', workspace)
					a.Anchored = false; b.Anchored = false
				end
			end)
		end,
	},
}

return module
