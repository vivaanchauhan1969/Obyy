r = 255
g = 0
b = 0

while true do
	wait(0.005)
	
    while (r == 255 and g ~= 255) do
	wait(0.005)
	g = g + 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end
	wait(0.005)
	r = r - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	while (r ~= 0) do
	wait(0.005)
	r = r - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end

    while (g == 255 and b ~= 255) do
	wait(0.005)
	b = b + 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end
	wait(0.005)
	g = g - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	while (g ~= 0) do
	wait(0.005)
	g = g - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end
	
	while (b == 255 and r ~= 255) do
	wait(0.005)
	r = r + 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end
	wait(0.005)
	b = b - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	while (b ~= 0) do
	wait(0.005)
	b = b - 1
	script.Parent.Color = Color3.fromRGB(r,g,b)
	end
	script.Parent.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
end)
end
local block = script.Parent
db = false

function onTouch()
	if db == false then
		db = true
		for i = 1, 20 do
			block.Transparency = i/20
			wait(0.05)
		end
		block.CanCollide = false
		wait(2)
		block.CanCollide = true
		block.Transparency = 0
		db = false
	end
end

block.Touched:connect(onTouch)
		if a == 1 then
			flow[#flow + 1] = Instance.new("Part")
			local p = flow[#flow]
			p.formFactor = form
			p.Size = siz
			p.Anchored = true
			p.CanCollide = false
			p.TopSurface = 0
			p.BottomSurface = 0
			if #flow - 1 > 0 then
				local pr = flow[#flow - 1]
				p.Position = torso.Position - torso.Velocity/ndist
				CFC(p, pr)
			else
				p.CFrame = CFrame.new(torso.Position - torso.Velocity/ndist, torso.CFrame.lookVector)
			end
			p.BrickColor = BrickColor.new("Cyan")
			p.Transparency = 1
			p.Parent = torso
			local marm = Instance.new("BlockMesh")
			marm.Scale = Vector3.new(1.9, 0.9, 1.725)
			marm.Parent = p
			local amplitude
			local frequency
			amplitude = pi
			desiredAngle = amplitude
			RightShoulder.MaxVelocity = 0.4
			LeftShoulder.MaxVelocity = 0.4
			RightHip.MaxVelocity = pi/10
			LeftHip.MaxVelocity = pi/10
			RightShoulder.DesiredAngle = desiredAngle
			LeftShoulder.DesiredAngle = -desiredAngle
			RightHip.DesiredAngle = 0
			LeftHip.DesiredAngle = 0
		end
	end
