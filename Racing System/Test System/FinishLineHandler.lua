-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local FinishLine = game.Workspace.FinishLine
local BoolValue = game.ServerStorage.FinishLineActivate
local ReceiverBindable = ReplicatedStorage:WaitForChild("FinishLine")
local BindableRaceEndRemote = ReplicatedStorage:WaitForChild("BindableGUIRaceEnd")
local RaceEndRemote = ReplicatedStorage:WaitForChild("GUIRaceEnd")

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
	
	-- If part that touches player is a Player, it makes a PlayerName variable
	local PlayerThatTouched = game.Players:GetPlayerFromCharacter(hit.Parent)
	if game.Players:GetPlayerFromCharacter(hit.Parent)then
		PlayerName = tostring(hit.Parent.Name)
	end
	
	if PlayerName then
		if not foundInList(PlayerName) then -- Checks if PlayerName is not in the blacklist table
			table.insert(playersBlackList, PlayerName) -- Inserts PlayerName into blacklist table
			
			if game.Players:GetPlayerFromCharacter(hit.Parent)then
				BindableRaceEndRemote:Fire(PlayerThatTouched, PlayerName)
				BoolValue.Value = true
				if BoolValue.Value == true then
					BoolValue.Value = false
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
