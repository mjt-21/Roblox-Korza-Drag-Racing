-- Variables
local RacingBool2 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool2
local RaceTime2 = game.ServerStorage.RacingSystemStorage.PlayerTimes.Time2

RacingBool2.Changed:Connect(function()
	if RacingBool2.Value == true then
		local startTime = tick()
		while RacingBool2.Value == true do
			game:GetService("RunService").Heartbeat:Wait()
			RaceTime2.Value = tick() - startTime
		end 
	end
end)
