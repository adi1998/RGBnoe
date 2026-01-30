Hue = 0

local threadStarted = false

modutil.mod.Path.Wrap("SetupMap", function(base)
    game.LoadPackages({Names = {_PLUGIN.guid}})
    if not threadStarted then
        game.thread(mod.CycleDressHue)
        threadStarted = true
    end
    base()
end)