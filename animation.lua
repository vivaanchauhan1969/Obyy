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
{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
},
walk = { 
{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
}, 
run = {
{ id = "run.xml", weight = 10 } 
}, 
jump = {
{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
}, 
fall = {
{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
}, 
climb = {
{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
}, 
sit = {
{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
},
toolnone = {
{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
},
toolslash = {
{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
},
toollunge = {
{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
},
wave = {
{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
},
point = {
{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
},
dance1 = {
{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
},
dance2 = {
{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
},
dance3 = {
{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
},
laugh = {
{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
},
cheer = {
{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
},
}
local dances = {"dance1", "dance2", "dance3"}
local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

function configureAnimationSet(name, fileList)
if (animTable[name] ~= nil) then
for _, connection in pairs(animTable[name].connections) do
connection:disconnect()
end
end
animTable[name] = {}
animTable[name].count = 0
animTable[name].totalWeight = 0
animTable[name].connections = {}
local config = script:FindFirstChild(name)
if (config ~= nil) then
print("Loading anims " .. name)
table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
local idx = 1
for _, childPart in pairs(config:GetChildren()) do
      if (childPart:IsA("Animation")) then
table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
animTable[name][idx] = {}
animTable[name][idx].anim = childPart
