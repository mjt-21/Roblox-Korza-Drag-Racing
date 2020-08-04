-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

-- Variables
local RemoteFunction = ReplicatedStorage:WaitForChild("PlayerNumFunction")
local FinishLineBindable = ReplicatedStorage:WaitForChild("FinishLine")

local Time1 = ServerStorage.PlayerTimes.Time1
local Time2 = ServerStorage.PlayerTimes.Time2
local Time3 = ServerStorage.PlayerTimes.Time3
local Time4 = ServerStorage.PlayerTimes.Time4


local RacingBool1 = game.ServerStorage.RacingBools.RacingBool1
local RacingBool2 = game.ServerStorage.RacingBools.RacingBool2
local RacingBool3 = game.ServerStorage.RacingBools.RacingBool3
local RacingBool4 = game.ServerStorage.RacingBools.RacingBool4

local FinishLineBool = game.ServerStorage.FinishLineActivate

local GuiEvent = ReplicatedStorage:WaitForChild("RaceStats")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")
local BindableRaceEnd = ReplicatedStorage:WaitForChild("BindableGUIRaceEnd")

-- Creates main table which stores the players' stats in a match
local PlayerAssignments = {
	{Name = "1nil", Time = Time1, TimeValue = Time1.Value, Bool = RacingBool1},
	{Name = "2nil", Time = Time2, TimeValue = Time2.Value, Bool = RacingBool2},
	{Name = "3nil", Time = Time3, TimeValue = Time3.Value, Bool = RacingBool3},
	{Name = "4nil", Time = Time4, TimeValue = Time4.Value, Bool = RacingBool4}
}

GuiEvent:FireAllClients(PlayerAssignments)

BindableRaceEnd.Event:Connect(function(PlayerThatTouched, PlayerName) -- Checks for when FinishLineHandler sees FinishLine is Touched
	FinishLineBindable:Invoke(PlayerAssignments) -- Invokes BindableEvent and passes the table through it
	RaceEndRemote:FireClient(PlayerThatTouched, PlayerName) -- Fires RemoteEvent to client, received in RaceGUIHandler
end)

RemoteFunction.OnServerInvoke = function(Player, LocalRaceTime) -- Checks for when RemoteFunction fires to server, then does the below
	
	for Var, Players in pairs(PlayerAssignments) do -- Cycles through the table
		if Players.Name == "1nil" then
			Players.Name = Player.Name -- Makes the name in the table equal to what the player name is
			Players.Time.Changed:Connect(function() -- Checks for when the Time.Value changes, then does below
				GuiEvent:FireAllClients(PlayerAssignments) -- Sends updated table to RaceGUIHandler
				Players.TimeValue = Players.Time.Value -- Keeps the player's TimeValue updated
			end)
			break -- Stops the loop
			-- Continues on doing the same thing, checking each name value in the table
		elseif
			Players.Name == "2nil" then
			Players.Name = Player.Name
			Players.Time.Changed:Connect(function()
				GuiEvent:FireAllClients(PlayerAssignments)
				Players.TimeValue = Players.Time.Value
			end)
			break
		elseif
			Players.Name == "3nil" then
			Players.Name = Player.Name
			Players.Time.Changed:Connect(function()
				GuiEvent:FireAllClients(PlayerAssignments)
				Players.TimeValue = Players.Time.Value
			end)
			break
		elseif
			Players.Name == "4nil" then
			Players.Name = Player.Name
			Players.Time.Changed:Connect(function()
				GuiEvent:FireAllClients(PlayerAssignments)
				Players.TimeValue = Players.Time.Value
			end)
			break
		end
	end
end
