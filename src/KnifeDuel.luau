local cloneref = type(cloneref) == "function" and cloneref or function(obj) return obj end

local UIS = cloneref(game:GetService("UserInputService"))

local Scale = 1
local Names = true

local Key = Enum.KeyCode.P -- EDITABLE

function AddHighlight(targetObject)
    if not targetObject:FindFirstChild("TeamHighlight") then
        local Highlight = Instance.new"Highlight"
        Highlight.Name = "TeamHighlight"
        Highlight.FillColor = Color3.fromRGB(255,0,0)
        Highlight.OutlineColor = Color3.fromRGB(255,0,0)
        Highlight.FillTransparency = 0.7
        Highlight.Parent = targetObject
    end
    
    if not targetObject.Head:FindFirstChild("TeamName") then
        local Billboard = Instance.new("BillboardGui")
        Billboard.Size = UDim2.new(2,0,1,0)
        Billboard.Name = "TeamName"
        Billboard.Parent = targetObject.Head
        Billboard.AlwaysOnTop = true
        Billboard.Enabled = Names

        local TextLabel = Instance.new("TextLabel")
        TextLabel.TextScaled = true
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel.Text = targetObject.Name
        TextLabel.Size = UDim2.new(0,40,0,15)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = Billboard
    end
    

end

UIS.InputBegan:Connect(function(inp, g)
    if inp.KeyCode == Key then
        Scale = Scale == 1 and 3 or Scale == 3 and 6 or 1
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Character and v ~= game.Players.LocalPlayer and not v.Character:FindFirstChild("MatchTeammateHighlight") then
                if not v.Character:FindFirstChild("Head") then
                    continue
                end
                v.Character.Head.Size = Vector3.new(Scale, Scale, Scale)
                AddHighlight(v.Character)
            elseif v.Character:FindFirstChild("MatchTeammateHighlight") then
                v.Character.Head.Size = Vector3.new(1,1,1)
                if v.Character:FindFirstChild("TeamHighlight") then
                    v.Character.TeamHighlight:Destroy()
                end
            end
        end
    elseif inp.KeyCode == Enum.KeyCode.O then
        Names = not Names
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Character and v ~= game.Players.LocalPlayer then 
                if not v.Character:FindFirstChild("Head") then
                    continue
                end
                if v.Character.Head:FindFirstChild("TeamName") then
                    v.Character.Head.TeamName.Enabled = Names
                end
            end
        end
    end
end)
