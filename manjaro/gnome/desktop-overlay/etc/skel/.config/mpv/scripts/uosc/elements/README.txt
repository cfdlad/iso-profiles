##############################################
##### scripts/uosc/elements/Controls.lua #####
##############################################

# Originals
playlist = 'command:list_alt:script-binding uosc/playlist?' .. t('Playlist'),
['open-file'] = 'command:file_open:script-binding uosc/open-file?' .. t('Open file'),
['items'] = 'command:list_alt:script-binding uosc/items?' .. t('Playlist/Files'),

# Modified
playlist = 'command:list_alt:script-binding uosc/playlist#playlist>1?' .. t('Playlist'),
['open-file'] = 'command:folder:script-binding uosc/open-file?' .. t('Open file'),
['items'] = 'command:list_alt:script-binding uosc/items#playlist>1?' .. t('Playlist/Files'),



############################################
##### scripts/uosc/elements/TopBar.lua #####
############################################

Note:	Rename the original uosc 'TopBar.lua' to 'TopBar.luax'
		Copy dyp 'TopBar.lua' from inside '/run/media/manjaro/usb16/mpv/mpv-scripts/configs/dyphire/mpv-dyp.zip' 
		and paste it in the 'scripts/uosc/elements/' folder
		Modify the new dyp 'TopBar.lua' as shown below
		'filter_none' is the fullscreen icon you want "the one with 2 squares"
		'crop_square' is the one with a single square

#Original
Line 141: 				button.icon = state.fullscreen and 'close_fullscreen' or
Line 142: 				(state.maximized and 'filter_none' or 'crop_square') 

#Modified
Line 141:				button.icon = state.fullscreen and 'filter_none' or
Line 142:				(state.maximized and 'crop_square' or 'crop_square') 



####################
##### main.lua #####
####################

This file has changed the details are in the file (check line 1)
But it is due to uosc playlist using media title instead of filename
(no option is given in 'mpv/scripts-opts/uosc.conf' to change this setting)
This problem affects files that all have the same media title (internal name)
The file can be found in 'mpv/scripts/uosc/main.lua' (its not here in the elements folder)

Note: The problem also affects memo (recent/history manager), but memo has an option to use filenames instead of media title in 'mpv/scripts-opts/memo.conf' which I have set to filenames

memo's option for this is given below (memo.conf)

# Display titles instead of filenames when available
use_titles=no










#############################################################################################################
## Not working, just use above instructions

# scripts/uosc/elements/TopBar.luax

# Original
-- Window controls
	if options.top_bar_controls then
		local is_left, button_ax = options.top_bar_controls == 'left', 0
		if is_left then
			button_ax = ax
			ax = self.size * #self.buttons
		else
			button_ax = bx - self.size * #self.buttons
			bx = button_ax
		end

		for _, button in ipairs(self.buttons) do
			local rect = {ax = button_ax, ay = self.ay, bx = button_ax + self.size, by = self.by}
			local is_hover = get_point_to_rectangle_proximity(cursor, rect) == 0
			local opacity = is_hover and 1 or config.opacity.controls
			local button_fg = is_hover and (button.hover_fg or bg) or fg
			local button_bg = is_hover and (button.hover_bg or fg) or bg

			cursor:zone('primary_click', rect, button.command)

			local bg_size = self.size - margin
			local bg_ax, bg_ay = rect.ax + (is_left and margin or 0), rect.ay + margin
			local bg_bx, bg_by = bg_ax + bg_size, bg_ay + bg_size

			ass:rect(bg_ax, bg_ay, bg_bx, bg_by, {
				color = button_bg, opacity = visibility * opacity, radius = state.radius,
			})

			ass:icon(bg_ax + bg_size / 2, bg_ay + bg_size / 2, bg_size * 0.5, button.icon, {
				color = button_fg,
				border_color = button_bg,
				opacity = visibility,
				border = options.text_border * state.scale,
			})

			button_ax = button_ax + self.size
		end
	end




# Modified
-- Window controls
	if options.top_bar_controls then
		local is_left, button_ax = options.top_bar_controls == 'left', 0
		if is_left then
			button_ax = ax
			ax = self.size * #self.buttons
		else
			button_ax = bx - self.size * #self.buttons
			bx = button_ax
		end

		for _, button in ipairs(self.buttons) do
			if button.is_max then
				button.icon = state.fullscreen and 'close_fullscreen' or
				(state.maximized and 'filter_none' or 'crop_square')
			end

			local rect = {ax = button_ax, ay = self.ay, bx = button_ax + self.size, by = self.by}
			local is_hover = get_point_to_rectangle_proximity(cursor, rect) == 0
			local opacity = is_hover and 1 or config.opacity.controls
			local button_fg = is_hover and (button.hover_fg or bg) or fg
			local button_bg = is_hover and (button.hover_bg or fg) or bg

			cursor:zone('primary_click', rect, button.command)

			local bg_size = self.size - margin
			local bg_ax, bg_ay = rect.ax + (is_left and margin or 0), rect.ay + margin
			local bg_bx, bg_by = bg_ax + bg_size, bg_ay + bg_size

			ass:rect(bg_ax, bg_ay, bg_bx, bg_by, {
				color = button_bg, opacity = visibility * opacity, radius = state.radius,
			})

			ass:icon(bg_ax + bg_size / 2, bg_ay + bg_size / 2, bg_size * 0.5, button.icon, {
				color = button_fg,
				border_color = button_bg,
				opacity = visibility,
				border = options.text_border * state.scale,
			})

			button_ax = button_ax + self.size
		end
	end
