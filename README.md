local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)  -- 크기 설정 (너비 200, 높이 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)  -- 화면 중앙에 배치
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 200)  -- 배경 색상 설정
frame.Parent = screenGui

-- 텍스트 레이블 생성
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)  -- 크기를 프레임에 맞게 설정
textLabel.Text = "이준서 스크립트 ㅋ"  -- 텍스트 설정
textLabel.TextColor3 = Color3.new(1, 1, 1)  -- 텍스트 색상 (흰색)
textLabel.TextScaled = true  -- 텍스트 크기 자동 조정
textLabel.Parent = frame
