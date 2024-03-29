local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEventCountdown")

local RacingBool1 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool1
local RacingBool2 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool2
local RacingBool3 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool3
local RacingBool4 = game.ServerStorage.RacingSystemStorage.RacingBools.RacingBool4	

RemoteEvent.OnServerEvent:Connect(function()
	
RemoteEvent:FireAllClients()
	
local seconds = ReplicatedStorage:WaitForChild("CountdownTime")

local function PreStage()
	
		local prestagelights1 =  game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.StageSigns.PreStageLights:FindFirstChildOfClass("PointLight")
		local prestagelights2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.StageSigns.PreStageLights:FindFirstChildOfClass("PointLight")
		local prestagelights3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.StageSigns.PreStageLights:FindFirstChildOfClass("PointLight")
		local prestagelightsparts1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.StageSigns.PreStageLights:GetChildren()
		local prestagelightsparts2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.StageSigns.PreStageLights:GetChildren()
		local prestagelightsparts3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.StageSigns.PreStageLights:GetChildren()
		
		
	for _, prestagelightsparts3 in pairs(prestagelightsparts3) do
   
    if prestagelights3 then
        prestagelights3.Enabled = true
    end
end

for _, prestagelightsparts3 in pairs(prestagelightsparts3) do
    prestagelightsparts3.Material = Enum.Material.Neon
		end
		
		
		
for _, prestagelightsparts2 in pairs(prestagelightsparts2) do
   
    if prestagelights2 then
        prestagelights2.Enabled = true
    end
end

for _, prestagelightsparts2 in pairs(prestagelightsparts2) do
    prestagelightsparts2.Material = Enum.Material.Neon
		end
		
		
		
for _, prestagelightsparts1 in pairs(prestagelightsparts1) do
   
    if prestagelights1 then
        prestagelights1.Enabled = true
    end
end

for _, prestagelightsparts1 in pairs(prestagelightsparts1) do
    prestagelightsparts1.Material = Enum.Material.Neon
		end
		
	end


local function Stage()
	
	local stagelights1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.StageSigns.StageLights:FindFirstChildOfClass("PointLight")
	local stagelightsparts1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.StageSigns.StageLights:GetChildren()
		
	local stagelights2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.StageSigns.StageLights:FindFirstChildOfClass("PointLight")
	local stagelightsparts2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.StageSigns.StageLights:GetChildren()
		
	local stagelights3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.StageSigns.StageLights:FindFirstChildOfClass("PointLight")
	local stagelightsparts3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.StageSigns.StageLights:GetChildren()
		
	for _, stagelightsparts1 in pairs(stagelightsparts1) do
   
    if stagelights1 then
        stagelights1.Enabled = true
    end
end

for _, stagelightsparts1 in pairs(stagelightsparts1) do
    stagelightsparts1.Material = Enum.Material.Neon
		end
		
		
		
for _, stagelightsparts2 in pairs(stagelightsparts2) do
   
    if stagelights2 then
        stagelights2.Enabled = true
    end
end

for _, stagelightsparts2 in pairs(stagelightsparts2) do
    stagelightsparts2.Material = Enum.Material.Neon
		end		
		
		
		
		
for _, stagelightsparts3 in pairs(stagelightsparts3) do
   
    if stagelights3 then
        stagelights3.Enabled = true
    end
end

for _, stagelightsparts3 in pairs(stagelightsparts3) do
    stagelightsparts3.Material = Enum.Material.Neon
	end	
end


local function Red()
	local RedLights1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.RedLights.Lights:FindFirstChildOfClass("PointLight")
	local RedLightsParts1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.RedLights.Lights:GetChildren()
		
	local RedLights2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.RedLights.Lights:FindFirstChildOfClass("PointLight")
	local RedLightsParts2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.RedLights.Lights:GetChildren()
		
	local RedLights3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.RedLights.Lights:FindFirstChildOfClass("PointLight")
	local RedLightsParts3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.RedLights.Lights:GetChildren()	
	
for _, RedLightsParts1 in pairs(RedLightsParts1) do
   
    if RedLights1 then
        RedLights1.Enabled = true
    end
end

for _, RedLightsParts1 in pairs(RedLightsParts1) do
    RedLightsParts1.Material = Enum.Material.Neon
		end
		
		
		
for _, RedLightsParts2 in pairs(RedLightsParts2) do
   
    if RedLights2 then
        RedLights2.Enabled = true
    end
end

for _, RedLightsParts2 in pairs(RedLightsParts2) do
    RedLightsParts2.Material = Enum.Material.Neon
		end		
		
		
		
for _, RedLightsParts3 in pairs(RedLightsParts3) do
   
    if RedLights3 then
        RedLights3.Enabled = true
    end
end

for _, RedLightsParts3 in pairs(RedLightsParts3) do
    RedLightsParts3.Material = Enum.Material.Neon
	end		
end


local function Yellow()
	local YellowLights1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.YellowLights.Lights:FindFirstChildOfClass("PointLight")
	local YellowLightsParts1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.YellowLights.Lights:GetChildren()
		
	local YellowLights2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.YellowLights.Lights:FindFirstChildOfClass("PointLight")
	local YellowLightsParts2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.YellowLights.Lights:GetChildren()
		
	local YellowLights3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.YellowLights.Lights:FindFirstChildOfClass("PointLight")
	local YellowLightsParts3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.YellowLights.Lights:GetChildren()	
	
for _, YellowLightsParts1 in pairs(YellowLightsParts1) do
   
    if YellowLights1 then
        YellowLights1.Enabled = true
    end
end

for _, YellowLightsParts1 in pairs(YellowLightsParts1) do
    YellowLightsParts1.Material = Enum.Material.Neon
		end
		
		
		
for _, YellowLightsParts2 in pairs(YellowLightsParts2) do
   
    if YellowLights2 then
        YellowLights2.Enabled = true
    end
end

for _, YellowLightsParts2 in pairs(YellowLightsParts2) do
    YellowLightsParts2.Material = Enum.Material.Neon
		end	
		
for _, YellowLightsParts3 in pairs(YellowLightsParts3) do
   
    if YellowLights3 then
        YellowLights3.Enabled = true
    end
end

for _, YellowLightsParts3 in pairs(YellowLightsParts3) do
    YellowLightsParts3.Material = Enum.Material.Neon
	end		
end
	
	
local function Green()
	local GreenLights1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.GreenLights.Lights:FindFirstChildOfClass("PointLight")
	local GreenLightsParts1 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer1.GreenLights.Lights:GetChildren()
		
	local GreenLights2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.GreenLights.Lights:FindFirstChildOfClass("PointLight")
	local GreenLightsParts2 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer2.GreenLights.Lights:GetChildren()
		
	local GreenLights3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.GreenLights.Lights:FindFirstChildOfClass("PointLight")
	local GreenLightsParts3 = game.Workspace["Racing System"]["Countdown Lights"].RaceTimer3.GreenLights.Lights:GetChildren()	
	
for _, GreenLightsParts1 in pairs(GreenLightsParts1) do
   
    if GreenLights1 then
        GreenLights1.Enabled = true
    end
end

for _, GreenLightsParts1 in pairs(GreenLightsParts1) do
    GreenLightsParts1.Material = Enum.Material.Neon
		end
		
		
		
		
for _, GreenLightsParts2 in pairs(GreenLightsParts2) do
   
    if GreenLights2 then
        GreenLights2.Enabled = true
    end
end

for _, GreenLightsParts2 in pairs(GreenLightsParts2) do
    GreenLightsParts2.Material = Enum.Material.Neon
		end
		
		
		
		
for _, GreenLightsParts3 in pairs(GreenLightsParts3) do
   
    if GreenLights3 then
        GreenLights3.Enabled = true
    end
end

for _, GreenLightsParts3 in pairs(GreenLightsParts3) do
    GreenLightsParts3.Material = Enum.Material.Neon
		end
		
		
end
	
seconds.Value = 5

local function Countdown() -- Makes the countdown code into a local function.		
		
if seconds.Value == 5 then
			PreStage()
end

while seconds.Value > 0 do
	wait(1)
	seconds.Value = seconds.Value - 1

if seconds.Value == 3 then
	Stage()
end

if seconds.Value == 2 then
	Red()
end

if seconds.Value == 1 then
	Yellow()
end

if seconds.Value == 0 then
	Green()
				
	RacingBool1.Value = true
	RacingBool2.Value = true
	RacingBool3.Value = true
	RacingBool4.Value = true		
end				
		end
		
wait(1)		
seconds.Value = 5
	
end
	
Countdown()
	
end)
