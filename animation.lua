function   waitForChild(parent, childName)
local child = parent:findFirstChild(childName)
if child then return child end
while true do
child = parent.ChildAdded:wait()
if child.Name==childName then return child end
end
end
local Figure = script.Parent
local Torso = waitForChild(Figure, "Torso")
local RightShoulder = waitForChild(Torso, "Right Shoulder")
local LeftShoulder = waitForChild(Torso, "Left Shoulder")
local RightHip = waitForChild(Torso, "Right Hip")
local LeftHip = waitForChild(Torso, "Left Hip")
local Neck = waitForChild(Torso, "Neck")
local Humanoid;
for _,Child in pairs(Figure:GetChildren())do
if Child and Child.ClassName=="Humanoid"then
Humanoid=Child;
end;
end;
local pose = "Standing"
local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0
local animTable = {}
local animNames = { 
idle = {
