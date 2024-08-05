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
