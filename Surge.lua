local Creator = loadstring(game:HttpGet("https://pastebin.com/raw/0fSnvfGt"))()
 
local entity = Creator.createEntity({
    CustomName = "Surge",
 
    Model = "https://raw.githubusercontent.com/Ilikerobloxdoors/Surge-NOT-OUTDOORS-ONE-/main/Surge.rbxm",
 
    Speed = 187,
    DelayTime = 3,
    HeightOffset = 0,
 
    CanKill = true,
    KillRange = 40,
 
    BreakLights = true,
    BackwardsMovement = true,
 
    FlickerLights = {
        true,
        1.5,
    },
 
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 0.4,
    },
 
    CamShake = {
        true,
        {5.5, 35, 0.3, 1.5},
        100,
    },
 
    Jumpscare = {
        true,
        {
            Image1 = "rbxassetid://12627342122",
            Image2 = "rbxassetid://12627342122",
 
            Shake = true,
 
            Sound1 = {
                116282238939992,
                {Volume = 0.5},
            },
 
            Sound2 = {
                116282238939992,
                {Volume = 0.5},
            },
 
            Flashing = {
                true,
                Color3.fromRGB(145, 255, 0),
            },
 
            Tease = {
                false,
                Min = 0,
                Max = 0,
            },
        },
    },
 
    CustomDialog = {
        "You died to Surge..."
    },
})
 
 
-- ==========================================
-- ENTITY MOVING
-- ==========================================
 
entity.Debug.OnEntityMoving = function(Invincible, Hiding, plrCollisionPoint)
    print("Invincible: " .. tostring(Invincible))
    print("Player to Entity Collision (None hiding Point): "
        .. tostring(plrCollisionPoint))
    print("Hiding: " .. tostring(Hiding))
end
 
 
-- ==========================================
-- ENTITY SPAWNED
-- ==========================================
 
entity.Debug.OnEntitySpawned = function(entityTable)
    print("Surge has spawned:", entityTable.Model)
 
    local Lighting = game:GetService("Lighting")
    local correction = Lighting:FindFirstChild("MainColorCorrection")
 
    if correction then
        correction.TintColor = Color3.fromRGB(145, 255, 0)
    end
 
    local SoundService = game:GetService("SoundService")
    local sound = SoundService:FindFirstChild("SurgeSpawnSound")
 
    if sound then
        sound.Volume = 10
        sound.TimePosition = 0
        sound:Play()
    else
        warn("SurgeSpawnSound was not found in SoundService!")
    end
end
 
 
-- ==========================================
-- ENTITY DESPAWNED
-- ==========================================
 
entity.Debug.OnEntityDespawned = function(entityTable)
    print("Surge has despawned:", entityTable.Model)
 
    local Lighting = game:GetService("Lighting")
    local correction = Lighting:FindFirstChild("MainColorCorrection")
 
    if correction then
        correction.TintColor = Color3.fromRGB(255, 255, 255)
    end
 
    local SoundService = game:GetService("SoundService")
    local sound = SoundService:FindFirstChild("BoppiesSound")
 
    if sound then
        sound:Stop()
    end
end
 
 
-- ==========================================
-- ENTITY START MOVING
-- ==========================================
 
entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Surge has started moving:", entityTable.Model)
 
    local SoundService = game:GetService("SoundService")
    local sound = SoundService:FindFirstChild("BoppiesSound")
 
    if sound then
        sound.Looped = true
        sound:Play()
    end
end
 
 
-- ==========================================
-- ENTITY FINISHED REBOUND
-- ==========================================
 
entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Surge has finished rebound:", entityTable.Model)
end
 
 
-- ==========================================
-- ENTITY ENTERED ROOM
-- ==========================================
 
entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Surge entered room:", room)
end
 
 
-- ==========================================
-- LOOK AT ENTITY
-- ==========================================
 
entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player looked at Surge:", entityTable.Model)
 
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
 
    if player and player.Character then
        local humanoid =
            player.Character:FindFirstChildOfClass("Humanoid")
 
        if humanoid then
            humanoid.Health = 0
        end
    end
end
 
 
-- ==========================================
-- DEATH
-- ==========================================
 
entity.Debug.OnDeath = function(entityTable)
    warn("Player has died to Surge.")
end
 
 
-- ==========================================
-- RUN SURGE
-- ==========================================
 
Creator.runEntity(entity)
