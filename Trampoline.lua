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
debounce = true

function onTouched(hit)
	if (hit.Parent:findFirstChild("Humanoid") ~= nil and debounce == true) then
		debounce = false
		h = Instance.new("Hat")
		p = Instance.new("Part")
		h.Name = "FireRacingHelmet"
		p.Parent = h
		p.Position = hit.Parent:findFirstChild("Head").Position
		p.Name = "Handle" 
		p.formFactor = 0
		p.Size = Vector3.new(1, 1, 1) 
		p.BottomSurface = 0 
		p.TopSurface = 0 
		p.Locked = true 
		script.Parent.Mesh:clone().Parent = p
		h.Parent = hit.Parent
		h.AttachmentPos = Vector3.new(0, 0.30, -0.03)
		wait(5)
		debounce = true
	end
end

script.Parent.Touched:connect(onTouched)
bin = script.Parent

function onTouched(part)
	part.BrickColor = BrickColor.new(23)
	wait(0.01)
	part.Transparency.Reflectance = 0.1
	wait(0.1)
	part.Transparency.Reflectance  = 0.2
	wait(0.1)
	part.Transparency.Reflectance  = 0.3
	wait(0.1)
	part.Transparency.Reflectance  = 0.4
	wait(0.1)
	part.Transparency.Reflectance  = 0.5
	wait(0.1)
	part.Transparency.Reflectance  = 0.6
	wait(0.1)
	part.Transparency.Reflectance  = 0.7
	wait(0.1)
	part.Transparency.Reflectance  = 0.8
	wait(0.1)
        part.Transparency.Reflectance  = 0.9
	wait(0.1)
	part.Parent = nil
end

connection = bin.Touched:connect(onTouched)
