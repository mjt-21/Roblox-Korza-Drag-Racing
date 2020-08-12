-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local FinishLine = game.Workspace["Racing System"].FinishLine
local BoolValue = game.ServerStorage.RacingSystemStorage.FinishLineActivate
local ReceiverBindable = ReplicatedStorage:WaitForChild("FinishLine")
local BindableRaceEndRemote = ReplicatedStorage:WaitForChild("BindableGUIRaceEnd")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")
local raceInProgress = game.ServerStorage.RacingSystemStorage.RaceInProgress

local playersBlackList = {} -- Table to temporarily store players' that touched FinishLine already

function foundInList(player)
	for _,target in ipairs(playersBlackList) do -- Cycles through player black list table
		if target == player then
			-- Function returns true if the player is found in the playersBlackList table
			return true;
		end
	end
	return false; -- Functions returns false if the above is not true
end

FinishLine.Touched:Connect(function(hit) -- "hit" is the part that hits the FinishLine
	if raceInProgress.Value == true then
		local PlayerThatTouched = nil
		PlayerName = nil
	
		-- Sees if the part that's hit has a VehicleSeat, then gets the player that is occupying it, and puts the player object and name in two variables
		local children = hit.Parent.Parent:GetChildren()
		for _, child in pairs(children) do
			if child:IsA("VehicleSeat") then
				local player = child.Occupant.Parent
				PlayerThatTouched = game.Players:GetPlayerFromCharacter(player)
				PlayerName = child.Occupant.Parent.Name
			end
		end	
	
		-- The below makes it so that a player cannot hit the FinishLine and fire off the code more than once in a single match/race
		if PlayerName then
			if not foundInList(PlayerName) then -- Checks if PlayerName is not in the blacklist table
				table.insert(playersBlackList, PlayerName) -- Inserts PlayerName into blacklist table
			
				if PlayerThatTouched then
					BindableRaceEndRemote:Fire(PlayerThatTouched, PlayerName)
					BoolValue.Value = true
					if BoolValue.Value == true then
						BoolValue.Value = false
					end
				end
			end
		end
	end
end)

-- Receives main table from MainTableScript, then makes the Player's boolvalue true if name matches
ReceiverBindable.OnInvoke = function(PlayerAssignments)
	for Var, Players in pairs(PlayerAssignments) do
		if PlayerName == Players.Name then
			Players.Bool.Value = false
			break
		end
	end
end
