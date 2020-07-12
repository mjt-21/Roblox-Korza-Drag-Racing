local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEventCountdown")

local button = script.Parent.Parent.StartRace
local CountdownTime = ReplicatedStorage:WaitForChild("CountdownTime")
local text = script.Parent

button.MouseButton1Click:Connect(function()
	text.Text = CountdownTime.Value	
	button.Visible = false
	RemoteEvent:FireServer()
end)

RemoteEvent.OnClientEvent:Connect(function()
	
	text.Visible = true
	text.Text = CountdownTime.Value
	
	CountdownTime.Changed:Connect(function()
		text.Text = CountdownTime.Value
		
		if CountdownTime.Value == 0 then
			text.Text = "GO!"
		end 
		
		if CountdownTime.Value == 5 then
			button.Visible = true
			text.Visible = false
		end

	end)
end)
