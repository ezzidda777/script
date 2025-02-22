-- 간단한 프레임 + 텍스트 버튼 추가하는 로블록스 GUI 스크립트
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:FindFirstChild("PlayerGui")

-- 프레임 생성
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)  -- 크기 설정 (너비 200, 높이 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)  -- 화면 중앙에 배치
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 200)  -- 배경 색상 설정
frame.Parent = screenGui

-- 텍스트 버튼 생성
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(1, 0, 1, 0)  -- 크기를 프레임에 맞게 설정
textButton.Text = "이준서의 스크립트"  -- 텍스트 설정
textButton.TextColor3 = Color3.new(1, 1, 1)  -- 텍스트 색상 (흰색)
textButton.TextScaled = true  -- 텍스트 크기 자동 조정
textButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- 버튼 배경 색상 설정
textButton.Parent = frame

-- 비행 상태 변수
local isFlying = false
local humanoid = player.Character and player.Character:WaitForChild("Humanoid")

-- 비행을 시작하는 함수
local function enableFly()
    if not humanoid or isFlying then return end
    isFlying = true

    -- BodyVelocity로 비행 효과 추가
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)  -- 최대 힘 설정
    bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- 위로 떠오르게 하는 힘
    bodyVelocity.Parent = player.Character:WaitForChild("HumanoidRootPart")

    -- 비행을 멈추는 함수
    local function disableFly()
        bodyVelocity:Destroy()
        isFlying = false
    end

    -- 텍스트 버튼 클릭 시 비행 토글
    textButton.MouseButton1Click:Connect(function()
        if isFlying then
            disableFly()
        else
            enableFly()
        end
    end)
end

-- 처음 클릭 시 비행을 활성화
textButton.MouseButton1Click:Connect(function()
    if not isFlying then
        enableFly()
    else
        disableFly()
    end
end)
