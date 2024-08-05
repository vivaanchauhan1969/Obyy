local AdamScript=script;
repeat Wait(0)until script and script.Parent and script.Parent:IsA("Model")and script.Parent:FindFirstChild("Head")and script.Parent:FindFirstChild("Torso");
local Adam=AdamScript.Parent;
local AdamHumanoid;
for _,Child in pairs(Adam:GetChildren())do
if Child and Child:IsA("Humanoid")and Child.Health>0.001 then
AdamHumanoid=Child;
end;
end;
local HasGear=false;
function raycast(Spos,vec,currentdist)
local Hit2,pos2=game.Workspace:FindPartOnRay(Ray.new(Spos+(vec*.05),vec*currentdist),Adam);
if Hit2~=nil and pos2 then
if Hit2.Name=="Handle"and not Hit2.CanCollide or string.sub(Hit2.Name,1,6)=="Effect"and not Hit2.CanCollide then
local currentdist=currentdist-(pos2-Spos).magnitude;
return raycast(pos2,vec,currentdist);
end;
end;
return Hit2,pos2;
end;
for _,Child in pairs(Adam:GetChildren())do
if Child and Child:IsA("Tool")then
end;
end;
function RayCast(Position,Direction,MaxDistance,IgnoreList)
return Game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(Position,Direction.unit*(MaxDistance or 999.999)),IgnoreList);
end;
local AttackDebounce=false;
while Wait(0)do
if AdamScript and Adam and Adam:FindFirstChild("Head")and AdamHumanoid and AdamHumanoid.Health==0 then
break
end;
if AdamScript and Adam and Adam:FindFirstChild("Torso")and AdamHumanoid and AdamHumanoid.Health>0.001 then
local TargetPoint=AdamHumanoid.TargetPoint;
local Blockage,BlockagePos=RayCast((Adam:FindFirstChild("Torso").CFrame+CFrame.new(Adam:FindFirstChild("Torso").Position,Vector3.new(TargetPoint.X,Adam:FindFirstChild("Torso").Position.Y,TargetPoint.Z)).lookVector*(Adam:FindFirstChild("Torso").Size.Z/2)).p,Adam:FindFirstChild("Torso").CFrame.lookVector,(Adam:FindFirstChild("Torso").Size.Z*2.5),{Adam,Adam})
if Blockage then
if Blockage and Blockage.Parent and Blockage.Parent.ClassName~="Workspace"then
local BlockageHumanoid;
for _,Child in pairs(Blockage.Parent:GetChildren())do
if Child and Child:IsA("Humanoid")and Child.Health>0.001 then
BlockageHumanoid=Child;
end;
end;
if Blockage and Blockage:IsA("Terrain")then
local CellPos=Blockage:WorldToCellPreferSolid((BlockagePos-Vector3.new(0,2,0)));
local CellMaterial,CellShape,CellOrientation=Blockage:GetCell(CellPos.X,CellPos.Y,CellPos.Z);
if CellMaterial==Enum.CellMaterial.Water then
end
elseif BlockageHumanoid or Blockage.ClassName=="TrussPart"or Blockage.ClassName=="WedgePart"or Blockage.Name=="Handle"and Blockage.Parent:IsA("Hat")or Blockage.Name=="Handle"and Blockage.Parent:IsA("Tool")then
end;
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and not AdamHumanoid.Sit and Jumpable then
end;
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and not AdamHumanoid.AutoJumpEnabled then
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and not AdamHumanoid.AutoRotate then
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and AdamHumanoid.PlatformStand then
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and AdamHumanoid.Sit then
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 then
end;
local NoticeDistance=0;
for _,TargetModel in pairs(Game:GetService("Workspace"):GetChildren())do
if TargetModel and TargetModel:IsA("Model")and TargetModel~=Adam and TargetModel.Name~=Adam.Name and TargetModel:FindFirstChild("Head")and TargetModel:FindFirstChild("Torso")and not HasGear then
local TargetPart=TargetModel:FindFirstChild("Torso");
local FoundHumanoid;
local FoundGear;
for _,Child in pairs(TargetModel:GetChildren())do
if Child and Child:IsA("Humanoid")and Child.Health>0.001 then
FoundHumanoid=Child;
end;
end;
for _,Child in pairs(TargetModel:GetChildren())do
if Child and Child:IsA("Tool")then
FoundGear=Child
end
;
end;
if AdamScript and Adam and Adam:FindFirstChild("HumanoidRootPart")and AdamHumanoid and AdamHumanoid.Health>0.001 and TargetPart and FoundHumanoid and FoundHumanoid.Health>0.001 and TargetModel and TargetPart and(TargetPart.Position-Adam:FindFirstChild("HumanoidRootPart").Position).magnitude<NoticeDistance and FoundGear then
NoticeDistance=(TargetPart.Position-Adam:FindFirstChild("HumanoidRootPart").Position).magnitude;
if AdamScript and Adam and Adam:FindFirstChild("HumanoidRootPart")and AdamHumanoid and AdamHumanoid.Health>0.001 and TargetPart and FoundHumanoid and FoundHumanoid.Health>0.001 and FoundHumanoid.Jump then
end;
if AdamScript and Adam and Adam:FindFirstChild("HumanoidRootPart")and AdamHumanoid and AdamHumanoid.Health>0.001 and TargetPart and FoundHumanoid and FoundHumanoid.Health>0.001 and TargetModel and TargetPart and(TargetPart.Position-Adam:FindFirstChild("HumanoidRootPart").Position).magnitude<5 and FoundGear and not AttackDebounce then
local Hit,pos=raycast(Adam:FindFirstChild("Torso").Position,(TargetPart.Position-Adam:FindFirstChild("Torso").Position).unit,500)
if Hit and Hit.Parent and Hit.Parent:IsA("Model")and Hit.Parent:FindFirstChild("Torso")and Hit.Parent:FindFirstChild("Head")then
Delay(0.5+math.random()*1,function()
AttackDebounce=false;
end);
AttackDebounce=true;
local SwingAnimation=AdamHumanoid:LoadAnimation(Adam:FindFirstChild("SwingAnimation"));
SwingAnimation:Play();
SwingAnimation:AdjustSpeed(1);
Spawn(function()
Wait(0.4);
if AdamScript and Adam and Adam:FindFirstChild("HumanoidRootPart")and AdamHumanoid and AdamHumanoid.Health>0.001 and TargetPart and FoundHumanoid and FoundHumanoid.Health>0.001 then
if AdamScript and Adam and Adam:FindFirstChild("HumanoidRootPart")and AdamHumanoid and AdamHumanoid.Health>0.001 and TargetPart and FoundHumanoid and FoundHumanoid.Health>0.001 and TargetModel and TargetPart and(TargetPart.Position-Adam:FindFirstChild("HumanoidRootPart").Position).magnitude<5 and FoundGear and FoundGear.Parent.ClassName~="Backpack"then
if AdamScript and Adam and Adam:FindFirstChild("Right Arm")and Adam:FindFirstChild("Right Arm"):FindFirstChild("AdamSlap")then
Adam:FindFirstChild("Right Arm"):FindFirstChild("AdamSlap"):Play();
end;
else
end;
end;
end);
end;
end;
AdamHumanoid:MoveTo(TargetPart.Position);
end;
else
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and HasGear then
local GearReleaseChance=math.random(1,5000);
local Tools=0;
for _,Child in pairs(Adam:GetChildren())do
if Child and Child:IsA("Tool")then
end;
end;
if AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and Tools==0 or AdamScript and Adam and AdamHumanoid and AdamHumanoid.Health>0.001 and Tools<0 then
end;
if GearReleaseChance==1 then
Wait(0);
for _,Child in pairs(Adam:GetChildren())do
if Child and Child:IsA("Tool")then
end;
end;
end;
end;
local RandomWalk=math.random(1,300);
local RandomJump=math.random(1,700);
if RandomWalk==1 then
AdamHumanoid:MoveTo(Game:GetService("Workspace"):FindFirstChild("Terrain").Position+Vector3.new(math.random(-2048,2048),0,math.random(-2048,2048)),Game:GetService("Workspace"):FindFirstChild("Terrain"));
end;
if RandomJump==0 then
end;
end;
end;
end;
end;
