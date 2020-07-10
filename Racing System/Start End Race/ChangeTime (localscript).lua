local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimeValue = ReplicatedStorage:WaitForChild("LapTime")
local RacingBool = ReplicatedStorage:WaitForChild("RacingBool")
local RaceTimeRE = ReplicatedStorage:WaitForChild("RaceTimeRE")
local TimeLabel = script.Parent

TimeLabel.Visible = false

RaceTimeRE.OnClientEvent:Connect(function()
	TimeValue.Changed:Connect(function()
		TimeLabel.Visible = true
		TimeLabel.Position = UDim2.new(-0.116, 0, 0.066, 0)
		TimeLabel.Text = tostring("Time: " .. TimeValue.Value)
	end)

	RacingBool.Changed:Connect(function()
		if RacingBool.Value == true then
			TimeLabel.Position = UDim2.new(0.285, 0, 0.463, 0)
			TimeLabel.Text = tostring("Your Time Was: " .. TimeValue.Value .. " Seconds")
			wait(4)
			TimeLabel.Visible = false
		end
	end)
end)
