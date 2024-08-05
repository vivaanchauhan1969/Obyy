local AdvancedRespawnScript=script;
repeat Wait(0)until script and script.Parent and script.Parent.ClassName=="Model";
local Adam=AdvancedRespawnScript.Parent;
local GameDerbis=Game:GetService("Debris");
local AdamHumanoid;
for _,Child in pairs(Adam:GetChildren())do
if Child and Child.ClassName=="Humanoid"and Child.Health>0.001 then
AdamHumanoid=Child;
end;
end;
local Respawndant=Adam:Clone();
coroutine.resume(coroutine.create(function()
if Adam and AdamHumanoid and AdamHumanoid:FindFirstChild("Status")and not AdamHumanoid:FindFirstChild("Status"):FindFirstChild("AvalibleSpawns")then
SpawnModel=Instance.new("Model");
SpawnModel.Parent=AdamHumanoid.Status;
SpawnModel.Name="AvalibleSpawns";
else
SpawnModel=AdamHumanoid:FindFirstChild("Status"):FindFirstChild("AvalibleSpawns");
end;
function FindSpawn(SearchValue)
local PartsArchivable=SearchValue:GetChildren();
for AreaSearch=1,#PartsArchivable do
if PartsArchivable[AreaSearch].className=="SpawnLocation"then
local PositionValue=Instance.new("Vector3Value",SpawnModel);
PositionValue.Value=PartsArchivable[AreaSearch].Position;
PositionValue.Name=PartsArchivable[AreaSearch].Duration;
end;
FindSpawn(PartsArchivable[AreaSearch]);
end;
end;
FindSpawn(Game.Workspace);
local SpawnChilden=SpawnModel:GetChildren();
if#SpawnChilden>0 then
local SpawnItself=SpawnChilden[math.random(1,#SpawnChilden)];
local RespawningForceField=Instance.new("ForceField");
RespawningForceField.Parent=Adam;
RespawningForceField.Name="SpawnForceField";
GameDerbis:AddItem(RespawningForceField,SpawnItself.Name);
Adam:MoveTo(SpawnItself.Value+Vector3.new(0,3.5,0));
else
if Adam:FindFirstChild("SpawnForceField")then
Adam:FindFirstChild("SpawnForceField"):Destroy();
end;
Adam:MoveTo(Vector3.new(0,115,0));
end;
end));
function Respawn()
Wait(5);
Respawndant.Parent=Adam.Parent;
Respawndant:makeJoints();
Respawndant:FindFirstChild("Head"):MakeJoints();
Respawndant:FindFirstChild("Torso"):MakeJoints();
Adam:remove();
end;
AdamHumanoid.Died:connect(Respawn);
