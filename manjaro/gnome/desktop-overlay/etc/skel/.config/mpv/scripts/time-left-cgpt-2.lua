--Sure! Here’s the updated script to format the time left dynamically as `mm:ss` when only minutes are left, and as `hh:mm:ss` when hours are left:

--```lua

local time_left_displayed = false
local timer

local function get_time_left()
    local duration = mp.get_property_number("duration", 0)
    local time_pos = mp.get_property_number("time-pos", 0)
    return duration - time_pos
end

local function format_time_left(time_left)
    local hours = math.floor(time_left / 3600)
    local minutes = math.floor((time_left % 3600) / 60)
    local seconds = math.floor(time_left % 60)
    
    if hours > 0 then
        return string.format("%02d:%02d:%02d", hours, minutes, seconds)
    else
        return string.format("%02d:%02d", minutes, seconds)
    end
end

local function display_time_left()
    local time_left = get_time_left()
    local formatted_time = format_time_left(time_left)
    mp.osd_message("Time left: " .. formatted_time, 2)
end

local function toggle_time_left()
    time_left_displayed = not time_left_displayed
    if time_left_displayed then
        timer = mp.add_periodic_timer(1, display_time_left)
        display_time_left()
    else
        if timer then
            timer:kill()
            timer = nil
        end
        mp.osd_message("")
    end
end

mp.add_key_binding("c", "display-time-left", display_time_left)
mp.add_key_binding("C", "toggle-time-left", toggle_time_left)

--```

----### Explanation of 1st Changes

--1. **get_time_left**: This function calculates the time left by subtracting the current playback position from the total duration of the video.
--2. **display_time_left**: This function formats the time left into hours, minutes, and seconds, then displays it as an OSD message for 2 seconds.
--3. **toggle_time_left**: This function toggles the continuous display of the time left. When toggled on, it sets a periodic timer to update the time left every second. When toggled off, it kills the timer and clears the OSD message.
--4. **Key bindings**:
--   - **b**: Binds the `b` key to display the time left as an OSD message.
--   - **B**: Binds the `B` key to toggle the continuous display of the time left on and off.

--Place this script in your `~/.config/mpv/scripts/` directory (or the equivalent directory for your OS). The script will be loaded automatically when you start mpv.


--### Explanation of 2nd Changes
--1. **format_time_left**: A new function that formats the time left into `hh:mm:ss` if hours are present, or `mm:ss` if only minutes and seconds are present.
--2. **display_time_left**: Calls `format_time_left` to format the time before displaying it.

--This should provide a more intuitive display of the remaining time based on the length of the time left.
