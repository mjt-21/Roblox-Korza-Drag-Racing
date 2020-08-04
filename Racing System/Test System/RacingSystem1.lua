-- Variables
local RacingBool1 = game.ServerStorage.RacingBools.RacingBool1
local RaceTime1 = game.ServerStorage.PlayerTimes.Time1

RacingBool1.Changed:Connect(function()
	if RacingBool1.Value == true then
		local startTime = tick()
		while RacingBool1.Value == true do
			game:GetService("RunService").Heartbeat:Wait()
			RaceTime1.Value = tick() - startTime
		end 
	end
end)
