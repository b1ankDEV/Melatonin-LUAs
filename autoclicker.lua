--[[
*
*   MELATONIN.WIN - AUTOCLICKER
*   blank
*
]]--

-- MENU --

local AUTOCLICKER = {
    TOGGLE = ui.new_checkbox("Settings", "Miscellaneous", "AutoClicker"),
    HOTKEY = ui.new_hotkey("Settings", "Miscellaneous", "ClickerBind", 0x01, 0, true),
    MIN    = ui.new_slider_int("Settings", "Miscellaneous", "Min Delay", 0, 500, 100),
    MAX    = ui.new_slider_int("Settings", "Miscellaneous", "Max Delay", 0, 500, 150),
}

-- CALLBACKS --

local LAST_TICK  = utility.get_tickcount()

cheat.set_callback("paint", function()
    if ui.get(AUTOCLICKER.HOTKEY) and ui.get(AUTOCLICKER.TOGGLE) then
        local CURRENT_TICK = utility.get_tickcount();
        if CURRENT_TICK - LAST_TICK >= utility.random_int(ui.get(AUTOCLICKER.MIN), ui.get(AUTOCLICKER.MAX))  then
            input.mouse_click(1)
            LAST_TICK = CURRENT_TICK
        end
    end
end)
