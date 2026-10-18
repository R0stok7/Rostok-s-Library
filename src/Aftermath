local ESP_Registry = {}

game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs(game.Workspace.game_assets.Entities:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("ServerCollider") then
        
            local Box, Line = nil, nil
            if ESP_Registry[v] then
                Box, Line = ESP_Registry.Box, ESP_Registry.Line
            else
                Box = Drawing.new("Square")
                Box.Size = Vector2.new(30,60)
                Box.Color = Color3.fromRGB(255,255,255)


                Line = Drawing.new("Line")
                Line.Visible = true
                Line.Thickness = 2
                Line.Color = Color3.fromRGB(255, 255, 255)
                ESP_Registry[v] = {Box = Box, Line = Line}
            end
            

            if v:FindFirstChild("ServerCollider") then
                local pos, x = workspace.CurrentCamera:WorldToScreenPoint(v.ServerCollider.Position)
                if x then
                    Box.Visible = true
                    Box.Position = Vector2.new (pos.X - 15 , pos.Y - 30)
                    
                    local viewportSize = camera.ViewportSize
                    local startPoint = Vector2.new(viewportSize.X / 2, viewportSize.Y)
                    
                    Line.From = startPoint
                    Line.To = Vector2.new(pos.X, pos.Y)
                    Line.Visible = true
                else
                    Line.Visible = false
                    Box.Visible = false
                end
            end
        end
    end

    for i,v in pairs(ESP_Registry) do
        if i == nil or i.Parent == nil then
            v.Box:Destroy()
            v.Line:Destroy()
            ESP_Registry[i] = nil
        end
    end
end)
