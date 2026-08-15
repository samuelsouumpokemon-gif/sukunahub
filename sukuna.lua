-- =================================================================
-- SUKUNA HUB - INTERFACE OFICIAL PARA MATRIXEXECUTOR
-- =================================================================

-- 1. Evita que o Hub se duplique caso seja executado mais de uma vez
if game.CoreGui:FindFirstChild("SukunaHub") then
    game.CoreGui.SukunaHub:Destroy()
end

-- 2. Criação da Instância Principal da Interface (Protegida no CoreGui)
local SukunaHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleText = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local ButtonContainer = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

SukunaHub.Name = "SukunaHub"
SukunaHub.Parent = game.CoreGui
SukunaHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 3. Estilização da Janela Principal (Main Frame)
MainFrame.Name = "MainFrame"
MainFrame.Parent = SukunaHub
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24) -- Cinza Escuro
MainFrame.BorderColor3 = Color3.fromRGB(150, 0, 0) -- Borda Vermelha (Sukuna)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true -- Permite arrastar o Hub pela tela com o mouse

-- 4. Barra de Título (Title Bar)
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 10, 10) -- Vermelho Escuro
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "SUKUNA HUB // MATRIX"
TitleText.TextColor3 = Color3.fromRGB(255, 0, 0) -- Texto Vermelho Vivo
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Botão Fechar (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 16

CloseButton.MouseButton1Click:Connect(function()
    SukunaHub:Destroy()
end)

-- 5. Painel de Botões (Container)
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 10, 0, 50)
ButtonContainer.Size = UDim2.new(1, -20, 1, -60)
ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, 400)
ButtonContainer.ScrollBarThickness = 6

UIListLayout.Parent = ButtonContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

-- 6. Função Auxiliar para Criar Botões de Hack Rapidamente
local function CriarBotao(nome, callback)
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Parent = ButtonContainer
    ScriptButton.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    ScriptButton.BorderColor3 = Color3.fromRGB(80, 0, 0)
    ScriptButton.BorderSizePixel = 1
    ScriptButton.Size = UDim2.new(1, -6, 0, 40)
    ScriptButton.Font = Enum.Font.Gotham
    ScriptButton.Text = nome
    ScriptButton.TextColor3 = Color3.fromRGB(230, 230, 230)
    ScriptButton.TextSize = 14
    
    -- Efeitos Visuais ao passar o mouse
    ScriptButton.MouseEnter:Connect(function()
        ScriptButton.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
        ScriptButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    end)
    ScriptButton.MouseLeave:Connect(function()
        ScriptButton.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        ScriptButton.BorderColor3 = Color3.fromRGB(80, 0, 0)
    end)
    
    ScriptButton.MouseButton1Click:Connect(callback)
end

-- =================================================================
-- CONFIGURAÇÃO DOS CHEATS / BOTÕES DO HUB
-- =================================================================

-- Botão 1: Velocidade Aumentada (Speed Hack)
CriarBotao("Speed Hack (Velocidade)", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 100 -- Altera a velocidade para 100
    end
end)

-- Botão 2: Pulo Alto (Jump Hack)
CriarBotao("Super Pulo", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 120 -- Altera a força do pulo
    end
end)

-- Botão 3: Ativar Visão através das Paredes (ESP Básico)
CriarBotao("Ativar ESP (Ver Players)", function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character and not p.Character:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = p.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        end
    end
end)

-- Botão 4: Carregar um Script Externo Famoso (Exemplo: Fly / Vfly)
CriarBotao("Carregar Infinite Yield (Admin)", function()
    loadstring(game:HttpGet('https://githubusercontent.com'))()
end)
