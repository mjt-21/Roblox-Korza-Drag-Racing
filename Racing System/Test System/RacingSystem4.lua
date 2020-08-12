-- Variables
local RacingBool4 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool4
local RaceTime4 = game.ServerStorage.RacingSystemStorage.PlayerTimes.Time4

RacingBool4.Changed:Connect(function()
	if RacingBool4.Value == true then
		local startTime = tick()
		while RacingBool4.Value == true do
			game:GetService("RunService").Heartbeat:Wait()
			RaceTime4.Value = tick() - startTime
		end 
	end
end)
