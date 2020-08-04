-- Services
local ServerStorage = game:GetService("ServerStorage")

local inProgressBool = ServerStorage.MatchStatus.InProgress

local RacingBool1 = ServerStorage.RacingBools.RacingBool1
local RacingBool2 = ServerStorage.RacingBools.RacingBool2
local RacingBool3 = ServerStorage.RacingBools.RacingBool3
local RacingBool4 = ServerStorage.RacingBools.RacingBool4

inProgressBool.Value = false

local function Countdown()

	local countdownNum = 5

	while countdownNum > 0 do
		print("Countdown: " .. countdownNum)
		countdownNum = countdownNum - 1
		wait(1)
		if countdownNum == 0 then
			print("GO!")
		
			inProgressBool.Value = true
		
			RacingBool1.Value = true
			RacingBool2.Value = true
			RacingBool3.Value = true
			RacingBool4.Value = true
		end
	end
end

wait(3)

Countdown()
