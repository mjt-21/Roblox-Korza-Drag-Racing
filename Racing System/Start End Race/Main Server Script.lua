local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CountdownTime = ReplicatedStorage:WaitForChild("CountdownTime")
local LapTime = ReplicatedStorage:WaitForChild("LapTime")
local RacingBool = ReplicatedStorage:WaitForChild("RacingBool")
local FinishLine = game.Workspace["Racing System"].FinishLine
local RaceTimeRE = ReplicatedStorage:WaitForChild("RaceTimeRE")

FinishLine.Touched:Connect(function()
	RacingBool.Value = true
end)

local function StartEnd()
	
	while RacingBool.Value == false
	do
		LapTime.Value = LapTime.Value + 0.1
		wait(0.1)
	end
	
	if RacingBool.Value == true
		then
		wait(5)
		LapTime.Value = 0
		RacingBool.Value = false
	end
	
end

CountdownTime.Changed:Connect(function()
	if CountdownTime.Value == 0 then
		RaceTimeRE:FireAllClients()
		StartEnd()
   end
end)
