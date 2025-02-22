-- Fly 기능 구현
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local mouse = player:GetMouse()

local flying = false
local bodyVelocity
local speed = 50

-- Fly 시작 및 종료 함수
local function startFly()
    if flying then return end
    flying = true

    -- 비행 중 몸체 설정
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000) -- 엄청난 힘을 가해 자유롭게 비행
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- 초기 속도 설정
    bodyVelocity.Parent = character.HumanoidRootPart

    -- 비행 속도 업데이트
    game:GetService("RunService").Heartbeat:Connect(function()
        if flying then
            bodyVelocity.Velocity = (mouse.Hit.p - character.HumanoidRootPart.Position).unit * speed
        end
    end)
end

-- Fly 종료 함수
local function stopFly()
    if not flying then return end
    flying = false

    -- BodyVelocity 제거하여 비행 종료
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

-- 마우스 클릭 시 플라이 시작 및 종료
mouse.Button1Down:Connect(function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

