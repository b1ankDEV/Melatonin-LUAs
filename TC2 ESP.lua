--[[
*
*  MELATONIN.WIN - TC2 ITEM ESP
*  blank
*
]]--

-- menu --

local ITEM_ESP = {
    SmallAmmo        = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "SmallAmmo"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "SmallAmmo Color", 255,255,255,255, true)
    },
    MediumAmmo       =  {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "MediumAmmo"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "MediumAmmo Color", 255,255,255,255, true)
    },
    LargeAmmo        = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "LargeAmmo"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "LargeAmmo Color", 255,255,255,255, true)
    },
    SmallHP          = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "SmallHP"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "SmallHP Color", 255,255,255,255, true)
    },
    MediumHP         = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "MediumHP"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "MediumHP Color", 255,255,255,255, true)
    },
    LargeHP          = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "LargeHP"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "LargeHP Color", 255,255,255,255, true)
    },
    DeadAmmo         = {
        TOGGLE =  ui.new_checkbox("Scripts", "Elements", "DeadAmmo"),
        PICKER =  ui.new_colorpicker("Scripts", "Elements", "DeadAmmo Color", 255,255,255,255, true)
    }
}

-- variables --

local WORKSPACE = game.get_workspace()
local MAP       = WORKSPACE:find_first_child("Map")
local ITEMS     = MAP:find_first_child("Items")
local ITEM_LIST = {};

-- threads --

local ITEM_THREAD  = {
    UPDATE = function() 
        ITEM_LIST = {};
        for _, VALUE in pairs(ITEMS:get_children()) do
                if ITEM_ESP[VALUE:get_name()] then
                    ITEM_LIST[#ITEM_LIST + 1] = {
                    Name = VALUE:get_name(),
                    Vector3 = vector(VALUE:get_position())
                }
            end
        end
    end,
    PAINT = function()  
        for _, VALUE in pairs(ITEM_LIST) do
            local POS_X, POS_Y = utility.world_to_screen(VALUE.Vector3:unpack());
            if POS_X ~= 0 and POS_Y ~= 0 and ui.get(ITEM_ESP[VALUE.Name].TOGGLE) then
                local COLORS = ui.get(ITEM_ESP[VALUE.Name].PICKER)
                render.text(POS_X, POS_Y, COLORS[1], COLORS[2], COLORS[3], COLORS[4], 1, false, VALUE.Name);
            end
        end
    end
}

-- CALLBACKS --

cheat.set_callback("update", ITEM_THREAD.UPDATE)
cheat.set_callback("paint", ITEM_THREAD.PAINT);