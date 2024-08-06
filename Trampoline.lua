local e = Instance.new("BodyPosition")

local flying = false

function onButton1Down(mouse)
flying = true
	while flying do
	e.Parent = script.Parent.Parent.Parent.Character.Torso
	e.position = Vector3.new(0,script.Parent.Parent.Parent.Character.Torso.Position.Y + 2.00000004,0)
	e.maxForce = Vector3.new(0,9000,0)
	wait(0.00000000000000000000000000000000000000000001)
	end
end

function onButton1Up(mouse)
flying = false
e:Remove()
end

function onSelected(mouse)
	mouse.Icon = "rbxasset://textures\\GunCursor.png"
	mouse.Button1Up:connect(function() onButton1Up(mouse) end)
	mouse.Button1Down:connect(function() onButton1Down(mouse) end)
end

script.Parent.Selected:connect(onSelected)
local defaultJumpPower = game:GetService("StarterPlayer").CharacterJumpPower

script.Parent.Touched:connect(function(obj)
	local humanoid = obj.Parent:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
	    humanoid.JumpPower = script.Parent.Parent.Configurations.JumpForce.Value
	    humanoid.Jump = true
	    wait(1)
	    humanoid.JumpPower = defaultJumpPower
	end
end)
