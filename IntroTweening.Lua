# Roblox-Korza-Drag-Racing
Korza Drag Racing Project 5/2020

wait(3)
--Services
local Tween = game:GetService("TweenService")

--Variables
local Sidebar = game.Players.LocalPlayer.PlayerGui.Menu.Sidebar
local PLAYBTN = Sidebar:WaitForChild("Play")
local Credits = Sidebar:WaitForChild("Credits")
local Title = Sidebar:WaitForChild("Title")

local Cam = workspace.CurrentCamera
local CamPoints = workspace:WaitForChild("CameraPoints")

--Tweens
local SlideOutSide = Tween:Create(Sidebar, TweenInfo.new(0.4, Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0,0,0,0)}):Play()--Slides Bar out

local HoverOverPlayBtn = Tween:Create(PLAYBTN, TweenInfo.new(0.5,Enum.EasingStyle.Back, Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.1,0)})
local LeavePlayBtn = Tween:Create(PLAYBTN, TweenInfo.new(0.5,Enum.EasingStyle.Back, Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.09,0)})

local HoverOverCreditsBtn = Tween:Create(Credits, TweenInfo.new(0.5,Enum.EasingStyle.Back, Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.1,0)})
local LeaveCreditsBtn = Tween:Create(Credits, TweenInfo.new(0.5,Enum.EasingStyle.Back, Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.09,0)})




--[[SlideOutSide:Play()]]--
--wait(2)
--HoverOverPlayBtn:Play()
--wait(2)
--HoverOverCreditsBtn:Play()--

--"SlideOutSide:Play()" Players.Player.PlayerGui.Menu.LocalScript:25: attempt to index nil with 'Play' I assume its becasue its dual firing the event.--

--PlayBTN
PLAYBTN.MouseEnter:Connect(function()
	HoverOverPlayBtn:Play()	
	
end)
PLAYBTN.MouseLeave:Connect(function()
	LeavePlayBtn:Play()


	
end)
--CREDITSBTN
Credits.MouseEnter:Connect(function()
	HoverOverCreditsBtn:Play()
		
	
end)
Credits.MouseLeave:Connect(function()
	LeaveCreditsBtn:Play()

	
end)

--CameraTweening
local function TweenCameraPos(Point, Speed)
	Tween:Create(Cam,TweenInfo.new(Speed, Enum.EasingStyle.Linear),{CFrame = Point.CFrame}):Play()
end	



Cam.CameraType = Enum.CameraType.Scriptable
Cam.FieldOfView = 50

while true do
Cam.CFrame = CamPoints:FindFirstChild("1").CFrame
TweenCameraPos(CamPoints:FindFirstChild("2"),3)
wait(3)
Cam.CFrame = CamPoints:FindFirstChild("3").CFrame
TweenCameraPos(CamPoints:FindFirstChild("4"),3)	
wait(3)	
Cam.CFrame = CamPoints:FindFirstChild("5").CFrame
	TweenCameraPos(CamPoints:FindFirstChild("6"),3)		
	wait(3)
	Cam.CFrame = CamPoints:FindFirstChild("7").CFrame
	TweenCameraPos(CamPoints:FindFirstChild("8"),3)	
	wait(3)
	Cam.CFrame = CamPoints:FindFirstChild("9").CFrame
	TweenCameraPos(CamPoints:FindFirstChild("10"),3)	
	wait(3)
	Cam.CFrame = CamPoints:FindFirstChild("11").CFrame
	TweenCameraPos(CamPoints:FindFirstChild("12"),3)	
	wait(3)
end

