local previousConfig = {}

rom.gui.add_imgui(function()
    if rom.ImGui.Begin("RGB Config") then
        drawMenu()
        rom.ImGui.End()
    end
end)

rom.gui.add_to_menu_bar(function()
    if rom.ImGui.BeginMenu("RGB Config") then
        drawMenu()
        rom.ImGui.EndMenu()
    end
end)

function drawMenu()
    local value, used = rom.ImGui.SliderInt("Frequency", config.delay, 1, 150, "%d%")
    if used and value ~= previousConfig.delay then
        previousConfig.delay = value
        config.delay = value
    end
end