-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

-- Variables
local RemoteFunction = ReplicatedStorage:WaitForChild("PlayerNumFunction")
local FinishLineBindable = ReplicatedStorage:WaitForChild("FinishLine")

local Time1 = ServerStorage.RacingSystemStorage.PlayerTimes.Time1
local Time2 = ServerStorage.RacingSystemStorage.PlayerTimes.Time2
local Time3 = ServerStorage.RacingSystemStorage.PlayerTimes.Time3
local Time4 = ServerStorage.RacingSystemStorage.PlayerTimes.Time4


local RacingBool1 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool1
local RacingBool2 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool2
local RacingBool3 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool3
local RacingBool4 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool4

local FinishLineBool = game.ServerStorage.RacingSystemStorage.FinishLineActivate

local GuiEvent = ReplicatedStorage:WaitForChild("RaceStats")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")
local BindableRaceEnd = ReplicatedStorage:WaitForChild("BindableGUIRaceEnd")
local noWinnersGUIRemote = ReplicatedStorage:WaitForChild("NoWinnersGUIRemote")

local countdownNum = ReplicatedStorage:WaitForChild("CountdownTime")
local raceInProgress = ServerStorage.RacingSystemStorage.RaceInProgress
local atLeastOnePlayerFinished = ServerStorage.RacingSystemStorage.AtLeastOnePlayerFinished
local atLeastTwoPlayersEntered = ServerStorage.RacingSystemStorage.AtLeast2PlayersEntered

-- Creates main table which stores the players' stats in a match
local PlayerAssignments = {
	{Name = "$1nil", Time = Time1, TimeValue = Time1.Value, Bool = RacingBool1},
	{Name = "$2nil", Time = Time2, TimeValue = Time2.Value, Bool = RacingBool2},
	{Name = "$3nil", Time = Time3, TimeValue = Time3.Value, Bool = RacingBool3},
	{Name = "$4nil", Time = Time4, TimeValue = Time4.Value, Bool = RacingBool4}
}

placesFirstBool = false
placesSecondBool = false
placesThirdBool = false
placesFourthBool = false

local function removeNonPlayers()
	if PlayerAssignments[1] then
		if PlayerAssignments[1].Name == "$1nil" or PlayerAssignments[1].Name == "$2nil" or PlayerAssignments[1].Name == "$3nil" or PlayerAssignments[1].Name == "$4nil" then
			table.remove(PlayerAssignments, 1)
		end
	end
	
	if PlayerAssignments[2] then
		if PlayerAssignments[2].Name == "$1nil" or PlayerAssignments[2].Name == "$2nil" or PlayerAssignments[2].Name == "$3nil" or PlayerAssignments[2].Name == "$4nil" then
			table.remove(PlayerAssignments, 2)
		end
	end
	
	if PlayerAssignments[3] then
		if PlayerAssignments[3].Name == "$1nil" or PlayerAssignments[3].Name == "$2nil" or PlayerAssignments[3].Name == "$3nil" or PlayerAssignments[3].Name == "$4nil" then
			table.remove(PlayerAssignments, 3)
		end
	end
	
	if PlayerAssignments[4] then
		if PlayerAssignments[4].Name == "$1nil" or PlayerAssignments[4].Name == "$2nil" or PlayerAssignments[4].Name == "$3nil" or PlayerAssignments[4].Name == "$4nil" then
			table.remove(PlayerAssignments, 4)
		end
	end
end

raceInProgress.Changed:Connect(function()
	while raceInProgress.Value == true do
		removeNonPlayers()
		wait(1)
	end
end)

local function setPlacesBools()
	for _, places in pairs(PlayerAssignments) do
   		if places.Name == "$1nil" then 
       		placesFirstBool = true
       		elseif places.Name == "$2nil" then
       		    placesSecondBool = true
       		elseif places.Name == "$3nil" then
       		    placesThirdBool = true
      		 elseif places.Name == "$4nil" then
      		     placesFourthBool = true
 	    end
	end
	
	if placesFirstBool == true or placesSecondBool == true or placesThirdBool == true or placesFourthBool == true then
    	atLeastOnePlayerFinished = true
	else
		atLeastOnePlayerFinished = false
	end
end

local function sortTable()
	table.sort(PlayerAssignments, function(a, b)
    	return a.TimeValue < b.TimeValue
	end)
end

for _, player in pairs(PlayerAssignments) do
	if player.Name == "$1nil" or player.Name == "$2nil" or player.Name == "$3nil" or player.Name == "$4nil" then
		player.TimeValue = 1000000
	end
end

GuiEvent:FireAllClients(PlayerAssignments)

-- To indicate that a race in progress when the countdown goes on 0 at the beginning of a race
countdownNum.Changed:Connect(function()
	if countdownNum.Value == 0 then
		raceInProgress.Value = true
	end
end)

BindableRaceEnd.Event:Connect(function(PlayerThatTouched, PlayerName) -- Checks for when FinishLineHandler sees FinishLine is Touched
	print("FinishLine Bindable Recieved In MainTableScript!")
	if raceInProgress.Value == true then
		setPlacesBools()
		raceInProgress.Value = false -- Indicates that a race is not in progress
		FinishLineBindable:Invoke(PlayerAssignments) -- Invokes BindableEvent and passes the table through it
		wait(0.1) -- Without the wait(0.1) there is a few miliseconds difference shown in GUI, due to the time it takes for the RemoteEvent to fire
		RaceEndRemote:FireClient(PlayerThatTouched, PlayerName) -- Fires RemoteEvent to client, received in RaceGUIHandler
	end
end)

RemoteFunction.OnServerInvoke = function(Player, LocalRaceTime) -- Checks for when RemoteFunction fires to server, then does the below
	if raceInProgress.Value == false then
		for Var, Players in pairs(PlayerAssignments) do -- Cycles through the table
			if Players.Name == "$1nil" then
				Players.Name = Player.Name -- Makes the name in the table equal to what the player name is
				Players.Time.Changed:Connect(function() -- Checks for when the Time.Value changes, then does below
					sortTable()
					GuiEvent:FireAllClients(PlayerAssignments) -- Sends updated table to RaceGUIHandler
					Players.TimeValue = Players.Time.Value -- Keeps the player's TimeValue updated
				end)
				break -- Stops the loop
				-- Continues on doing the same thing, checking each name value in the table
			elseif
				Players.Name == "$2nil" then
				Players.Name = Player.Name
				Players.Time.Changed:Connect(function()
					sortTable()
					GuiEvent:FireAllClients(PlayerAssignments)
					Players.TimeValue = Players.Time.Value
				end)
				break
			elseif
				Players.Name == "$3nil" then
				Players.Name = Player.Name
				Players.Time.Changed:Connect(function()
					sortTable()
					GuiEvent:FireAllClients(PlayerAssignments)
					Players.TimeValue = Players.Time.Value
				end)
				break
			elseif
				Players.Name == "$4nil" then
				Players.Name = Player.Name
				Players.Time.Changed:Connect(function()
					sortTable()
					GuiEvent:FireAllClients(PlayerAssignments)
					Players.TimeValue = Players.Time.Value
				end)
				break
			end
		end
	end
end

-- Function to handle ending the race after a certain amount of time, even if players don't touch FinishLine during a match/race
local function raceTimeout()
	local raceTimeLimitString = ("")	
	
	if raceInProgress.Value == true then
		local raceTimeLimit = 10 -- How many seconds after the race starts to automatically end it (if race is still in progress)
		while raceTimeLimit > 10 do
			raceTimeLimit -= 1
			wait(1)
		end
		-- If a race is in progress, it will countdown for raceTimeLiimit in order to
		if raceTimeLimit == 10 and raceInProgress.Value == true then
			while raceTimeLimit > 0 do
				raceTimeLimit -= 1
				raceTimeLimitString = ("Race Ending In " .. raceTimeLimit .. " Seconds!")
				noWinnersGUIRemote:FireAllClients(raceTimeLimitString)
				wait(1)
			end
			raceTimeLimitString = "Race Ended!"
			noWinnersGUIRemote:FireAllClients(raceTimeLimitString)
			-- Simulates the function of a race ending, stopping all players' RacingSystem scripts and changing raceInProgress to false
			for _, player in pairs(PlayerAssignments) do
				player.Bool.Value = false
			end
			raceInProgress.Value = false
			print("Race Ended!")
			if atLeastOnePlayerFinished == false then
				for _, player in pairs(PlayerAssignments) do
					player.Name = "$nil"
				end
			end
				noWinnersGUIRemote:FireAllClients()
		end
	end
end

raceInProgress.Changed:Connect(raceTimeout) -- Fires the raceTimeout() function every time the raceInProgress bool is changed
