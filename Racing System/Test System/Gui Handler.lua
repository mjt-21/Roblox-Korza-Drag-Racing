-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Variables
local button = script.Parent
local StatsFrame = script.Parent.Parent.Stats
local StatsRemote = ReplicatedStorage:WaitForChild("RaceStats")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")
local LocalPlayerName = Players.LocalPlayer.Name

local PlayerName1 = script.Parent.Parent.Stats:WaitForChild("PlayerName1")
local PlayerName2 = script.Parent.Parent.Stats:WaitForChild("PlayerName2")
local PlayerName3 = script.Parent.Parent.Stats:WaitForChild("PlayerName3")
local PlayerName4 = script.Parent.Parent.Stats:WaitForChild("PlayerName4")

local PlayerTime1 = script.Parent.Parent.Stats:WaitForChild("PlayerTime1")
local PlayerTime2 = script.Parent.Parent.Stats:WaitForChild("PlayerTime2")
local PlayerTime3 = script.Parent.Parent.Stats:WaitForChild("PlayerTime3")
local PlayerTime4 = script.Parent.Parent.Stats:WaitForChild("PlayerTime4")

local PlayerPlacementLabel = script.Parent.Parent:WaitForChild("PlayerPlacement")
local PlayerTimeLabel = script.Parent.Parent:WaitForChild("PlayerTime")

button.MouseButton1Click:Connect(function() -- Checks when player clicks the button
	if StatsFrame.Visible == false then
		StatsFrame.Visible = true
		button.Text = "Close Race Stats"
		-- Opens StatsFrame if it is already closed
	elseif
		StatsFrame.Visible == true then
		StatsFrame.Visible = false
		button.Text = "View Race Stats"
		-- Closes StatsFrame if it is already open
	end
end)

MainTable = {} -- Makes a global variable that will be made equal to the PlayerAssignments in MainTableScript (later)

StatsRemote.OnClientEvent:Connect(function(PlayerAssignments) -- Connects to RemoteEvent from MainTableScript, updates stats from table
	table.sort(PlayerAssignments, function(a, b)
    	return a.TimeValue < b.TimeValue
	end)
	
	MainTable = PlayerAssignments -- Makes the MainTable global variable be equal to the PlayerAssignments table in MainTableScript
	
	-- Makes PlayerNames texts be equal to the players' names in table
	PlayerName1.Text = PlayerAssignments[1].Name
	PlayerName2.Text = PlayerAssignments[2].Name
	PlayerName3.Text = PlayerAssignments[3].Name
	PlayerName4.Text = PlayerAssignments[4].Name
	
	-- Makes PlayerTimes texts be equal to the players' times in table
	PlayerTime1.Text = string.format("%0.3f", tostring(PlayerAssignments[1].TimeValue))
	PlayerTime2.Text = string.format("%0.3f", tostring(PlayerAssignments[2].TimeValue))
	PlayerTime3.Text = string.format("%0.3f", tostring(PlayerAssignments[3].TimeValue))
	PlayerTime4.Text = string.format("%0.3f", tostring(PlayerAssignments[4].TimeValue))
end)

RaceEndRemote.OnClientEvent:Connect(function(PlayerName) -- When player touches finish line, RemoteEvent connects and brings in PlayerName (who touched FinishLine)
	local PlayerPlace = nil -- Variable as placeholder for what place the player is in during/after the race
	-- Makes the PlayerPlace variable change based on the GUI (which is based on the table)
	if LocalPlayerName == PlayerName1.Text then
		PlayerPlace = "1st"
	elseif LocalPlayerName == PlayerName2.Text then
		PlayerPlace = "2nd"
	elseif LocalPlayerName == PlayerName3.Text then
		PlayerPlace = "3rd"
	elseif LocalPlayerName == PlayerName4.Text then
		PlayerPlace = "4th"
	end
	
	for _, Players in pairs(MainTable) do
		-- Makes the button become invisible if the Players name in table is equal to this Player's name
		if Players.Name == LocalPlayerName then
			button.Visible = false
			button.Text = "View Race Stats"
			
			if StatsFrame.Visible == true then
				StatsFrame.Visible = false
			end
			
			PlayerPlacementLabel.Visible = true
			PlayerTimeLabel.Visible = true
			PlayerPlacementLabel.Text = ("You Came In : " .. PlayerPlace .. " Place!")
			PlayerTimeLabel.Text = ("Your Time : " .. string.format("%0.3f", tostring(Players.TimeValue)))
			
			wait(3)
			
			PlayerPlacementLabel.Visible = false
			PlayerTimeLabel.Visible = false
			
			StatsFrame.Visible = true
			wait(5)
			StatsFrame.Visible = false
			button.Visible = true
			
			break
		end
	end
end)
