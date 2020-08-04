-- Variables
local RacingBool3 = game.ServerStorage.RacingBools.RacingBool3
local RaceTime3 = game.ServerStorage.PlayerTimes.Time3

RacingBool3.Changed:Connect(function()
	if RacingBool3.Value == true then
		local startTime = tick()
		while RacingBool3.Value == true do
			game:GetService("RunService").Heartbeat:Wait()
			RaceTime3.Value = tick() - startTime
		end 
	end
end)
