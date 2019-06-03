local core_mainmenu = require("core_mainmenu")

local _HairBlue  = 0x00AE7780
local _HairGreen = 0x00AE7781
local _HairRed   = 0x00AE7782

local display = false

local function PresentRGBHairColor()
    local blue  = pso.read_u8(_HairBlue)
    local green = pso.read_u8(_HairGreen)
    local red   = pso.read_u8(_HairRed)
    imgui.Text(string.format("R/G/B: %-0.2i/%-0.2i/%0.2i", red, green, blue))
end

local function present()
    if not display then
        return
    end

    imgui.Begin("Hair Color", nil, nil)
    PresentRGBHairColor()
    imgui.End()
end

-- TODO: Add actual options for window positioning and other dressing room data (proportions)...
local function init()
    local mainMenuButtonHandler = function()
        display = not display
    end
    core_mainmenu.add_button("Dressing Room Hair Color", mainMenuButtonHandler)
    
    return 
    {
        name = 'Dressing Room Hair Color',
        version = '0.0.1',
        author = 'Ender',
        present = present,
        toggleable = true,
    }
end


return 
{
    __addon = 
    {
        init = init,
    },
}
