local HttpService = game:GetService("HttpService")
local CommandGit = HttpService:GetAsync("https://raw.githubusercontent.com/ImSnox/LuaProjects/SnoxDomain/LinkStorm", true)
local GetCommands = loadstring(CommandGit)
local Commands = GetCommands()

local System = script.Parent
local Gui = System.Parent

local Background = Gui:WaitForChild('Background')
local Input = Background:FindFirstChild('Input')
local CommandInput = Input:FindFirstChild('CommandInput')
local CommandPlaceHolder = Background.CommandPlaceHolder

local NoCommands = CommandPlaceHolder:FindFirstChild('NoCommands')
local CommandTemplate = script:WaitForChild('Template')

--// Function to split a string into a table of words
local function split(str)
	local words = {}
	for word in str:gmatch("%S+") do
		table.insert(words, word)
	end
	return words
end

--// Search System [Provided From: https://devforum.roblox.com/t/how-can-i-create-a-search-system-in-game/647645/9]
CommandInput:GetPropertyChangedSignal("Text"):Connect(function()
	local InputText = string.lower(CommandInput.Text)
	local words = split(InputText)
	local commandName = words[1]

	-- Create a list to store the visible commands
	local visibleCommands = {}

	if #words > 0 then
		for _, Command in ipairs(Commands) do
			local commandNameLower = string.lower(Command.Name)
			if commandNameLower:sub(1, #commandName) == commandName then
				table.insert(visibleCommands, Command)
			end
		end
	end

	-- Clear and re-populate the CommandPlaceHolder based on the sorted list
	for _, Child in pairs(CommandPlaceHolder:GetChildren()) do
		if Child:IsA("Frame") and Child.Name ~= "NoCommands" then
			Child:Destroy()
		end
	end

	-- Re-populate the CommandPlaceHolder with the sorted list
	for _, Command in ipairs(visibleCommands) do
		local newTemplate = CommandTemplate:Clone()
		newTemplate.Parent = CommandPlaceHolder
		newTemplate.CommandName.Text = Command.Name
		newTemplate.CommandDescription.Text = Command.Description
		newTemplate.Visible = true
		newTemplate.Name = "CMD_"..Command.Name
		spawn(function()
			newTemplate.Trigger.Activated:Connect(function()
				CommandInput:CaptureFocus(); task.wait()
				CommandInput.Text = Command.Name
			end)
		end)
	end

	-- If the input is empty, show all commands, otherwise, show NoCommands frame if needed
	if #words == 0 then
		for _, Command in ipairs(Commands) do
			local newTemplate = CommandTemplate:Clone()
			newTemplate.Parent = CommandPlaceHolder
			newTemplate.CommandName.Text = Command.Name
			newTemplate.CommandDescription.Text = Command.Description
			newTemplate.Visible = true
			newTemplate.Name = "CMD_"..Command.Name
			spawn(function()
				newTemplate.Trigger.Activated:Connect(function()
					CommandInput:CaptureFocus(); task.wait()
					CommandInput.Text = Command.Name
				end)
			end)
		end
		NoCommands.Visible = false
	else
		-- If the first word matches a command name, don't show the NoCommands frame
		NoCommands.Visible = not (#words > 0 and #visibleCommands > 0)
	end
end)

--// Generate Commands
spawn(function()
	for _, Command in ipairs(Commands) do
		local newTemplate = CommandTemplate:Clone()
		newTemplate.Parent = CommandPlaceHolder
		newTemplate.CommandName.Text = Command.Name
		newTemplate.CommandDescription.Text = Command.Description
		newTemplate.Visible = true
		newTemplate.Name = "CMD_"..Command.Name
		spawn(function() newTemplate.Trigger.Activated:Connect(function() CommandInput:CaptureFocus(); task.wait(); CommandInput.Text = Command.Name end) end)
	end
end)
