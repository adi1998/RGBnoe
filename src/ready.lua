Hue = 0

local threadStarted = false

function mod.CycleDressHue()
    while true do
        if game.CurrentRun and game.CurrentRun.Hero and game.CurrentRun.Hero.ObjectId and not game.MapState.BabyPolymorph and not game.MapState.HostilePolymorph then
            game.SetThingProperty({Property = "GrannyTexture", Value = "zerp-RGBnoe/" .. tostring(Hue), DestinationId = game.CurrentRun.Hero.ObjectId})
        end
        Hue = Hue + 2
        Hue = (Hue + Hue%2) % 360
        game.wait(1/config.delay)
    end
end

modutil.mod.Path.Wrap("SetupMap", function(base)
    game.LoadPackages({Names = {_PLUGIN.guid}})
    game.thread(mod.CycleDressHue)
    base()
end)