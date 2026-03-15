Hue = 0
StartColor = {202, 105, 29, 255}
local threadStarted = false

function mod.ShiftStartColor()
    local h, s, v = rom.ImGui.ColorConvertRGBtoHSV(StartColor[1]/255, StartColor[2]/255, StartColor[3]/255)
    h = ((h*360 + Hue) % 360) / 360
    v = 1
    s = 1
    local r, g, b = rom.ImGui.ColorConvertHSVtoRGB(h, s, v)
    r,g,b = r*255, g*255, b*255
    game.SetLightBarColor({ PlayerIndex = 1, Color = {r,g,b,255} })
end

function mod.CycleDressHue()
    while true do
        if game.CurrentRun and game.CurrentRun.Hero and game.CurrentRun.Hero.ObjectId and not game.MapState.BabyPolymorph and not game.MapState.HostilePolymorph then
            game.SetThingProperty({Property = "GrannyTexture", Value = "zerp-RGBnoe/" .. tostring(Hue), DestinationId = game.CurrentRun.Hero.ObjectId})
        end
        Hue = Hue + 2
        Hue = (Hue + Hue%2) % 360
        mod.ShiftStartColor()
        game.wait(1/config.delay)
    end
end

modutil.mod.Path.Wrap("SetupMap", function(base)
    game.LoadPackages({Names = {_PLUGIN.guid}})
    game.thread(mod.CycleDressHue)
    base()
end)