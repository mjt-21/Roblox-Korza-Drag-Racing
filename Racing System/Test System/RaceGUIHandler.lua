--- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Variables
local button = script.Parent
local StatsFrame = script.Parent.Parent.Stats
local StatsRemote = ReplicatedStorage:WaitForChild("RaceStats")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")
local LocalPlayerName = Players.LocalPlayer.Name
local noWinnersGUIRemote = ReplicatedStorage:WaitForChild("NoWinnersGUIRemote")

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

local NoWinners = script.Parent.Parent:WaitForChild("NoWinners")

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

function updateGUI(PlayerAssignments) -- Connects to RemoteEvent from MainTableScript, updates stats from table
	-- StatsRemote Recived In RaceGUIHandler!
	MainTable = PlayerAssignments -- Makes the MainTable global variable be equal to the PlayerAssignments table in MainTableScript
	
	if PlayerAssignments[1] then
		PlayerName1.Text = PlayerAssignments[1].Name
		PlayerTime1.Text = string.format("%0.3f", tostring(PlayerAssignments[1].TimeValue))
	else
		PlayerName1.Text = ""
		PlayerTime1.Text = ""
	end
	
	if PlayerAssignments[2] then
		PlayerName2.Text = PlayerAssignments[2].Name
		PlayerTime2.Text = string.format("%0.3f", tostring(PlayerAssignments[2].TimeValue))
	else
		PlayerName2.Text = ""
		PlayerTime2.Text = ""
	end
	
	if PlayerAssignments[3] then
		PlayerName3.Text = PlayerAssignments[3].Name
		PlayerTime3.Text = string.format("%0.3f", tostring(PlayerAssignments[3].TimeValue))
	else
		PlayerName3.Text = ""
		PlayerTime3.Text = ""
	end
	
	if PlayerAssignments[4] then
		PlayerName4.Text = PlayerAssignments[4].Name
		PlayerTime4.Text = string.format("%0.3f", tostring(PlayerAssignments[4].TimeValue))
	else
		PlayerName4.Text = ""
		PlayerTime4.Text = ""
	end

end

StatsRemote.OnClientEvent:Connect(updateGUI)

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


function noWinners(raceTimeLimitString)
	NoWinners.Visible = true
	NoWinners.Text = raceTimeLimitString
	if raceTimeLimitString == "Race Ended!" then
		wait(3)
		NoWinners.Visible = false
	end
end

noWinnersGUIRemote.OnClientEvent:Connect(noWinners)
