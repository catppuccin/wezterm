local wezterm = require("wezterm")

local M = {}

local colors = {
	latte = {
		rosewater = "#dc8a78",
		flamingo = "#dd7878",
		pink = "#ea76cb",
		mauve = "#8839ef",
		red = "#d20f39",
		maroon = "#e64553",
		peach = "#fe640b",
		yellow = "#df8e1d",
		green = "#40a02b",
		teal = "#179299",
		sky = "#04a5e5",
		sapphire = "#209fb5",
		blue = "#1e66f5",
		lavender = "#7287fd",
		text = "#4c4f69",
		subtext1 = "#5c5f77",
		subtext0 = "#6c6f85",
		overlay2 = "#7c7f93",
		overlay1 = "#8c8fa1",
		overlay0 = "#9ca0b0",
		surface2 = "#acb0be",
		surface1 = "#bcc0cc",
		surface0 = "#ccd0da",
		crust = "#dce0e8",
		mantle = "#e6e9ef",
		base = "#eff1f5",
	},
	frappe = {
		rosewater = "#f2d5cf",
		flamingo = "#eebebe",
		pink = "#f4b8e4",
		mauve = "#ca9ee6",
		red = "#e78284",
		maroon = "#ea999c",
		peach = "#ef9f76",
		yellow = "#e5c890",
		green = "#a6d189",
		teal = "#81c8be",
		sky = "#99d1db",
		sapphire = "#85c1dc",
		blue = "#8caaee",
		lavender = "#babbf1",
		text = "#c6d0f5",
		subtext1 = "#b5bfe2",
		subtext0 = "#a5adce",
		overlay2 = "#949cbb",
		overlay1 = "#838ba7",
		overlay0 = "#737994",
		surface2 = "#626880",
		surface1 = "#51576d",
		surface0 = "#414559",
		base = "#303446",
		mantle = "#292c3c",
		crust = "#232634",
	},
	macchiato = {
		rosewater = "#f4dbd6",
		flamingo = "#f0c6c6",
		pink = "#f5bde6",
		mauve = "#c6a0f6",
		red = "#ed8796",
		maroon = "#ee99a0",
		peach = "#f5a97f",
		yellow = "#eed49f",
		green = "#a6da95",
		teal = "#8bd5ca",
		sky = "#91d7e3",
		sapphire = "#7dc4e4",
		blue = "#8aadf4",
		lavender = "#b7bdf8",
		text = "#cad3f5",
		subtext1 = "#b8c0e0",
		subtext0 = "#a5adcb",
		overlay2 = "#939ab7",
		overlay1 = "#8087a2",
		overlay0 = "#6e738d",
		surface2 = "#5b6078",
		surface1 = "#494d64",
		surface0 = "#363a4f",
		base = "#24273a",
		mantle = "#1e2030",
		crust = "#181926",
	},
	mocha = {
		rosewater = "#f5e0dc",
		flamingo = "#f2cdcd",
		pink = "#f5c2e7",
		mauve = "#cba6f7",
		red = "#f38ba8",
		maroon = "#eba0ac",
		peach = "#fab387",
		yellow = "#f9e2af",
		green = "#a6e3a1",
		teal = "#94e2d5",
		sky = "#89dceb",
		sapphire = "#74c7ec",
		blue = "#89b4fa",
		lavender = "#b4befe",
		text = "#cdd6f4",
		subtext1 = "#bac2de",
		subtext0 = "#a6adc8",
		overlay2 = "#9399b2",
		overlay1 = "#7f849c",
		overlay0 = "#6c7086",
		surface2 = "#585b70",
		surface1 = "#45475a",
		surface0 = "#313244",
		base = "#1e1e2e",
		mantle = "#181825",
		crust = "#11111b",
	},
}

local mappings = {
	mocha = "Catppuccin Mocha",
	macchiato = "Catppuccin Macchiato",
	frappe = "Catppuccin Frappe",
	latte = "Catppuccin Latte",
}

function M.select(palette, accent)
	-- shorthand to check for the Latte flavor
	local isLatte = palette == "latte"

	return {
		foreground = colors[palette].text,
		background = colors[palette].base,

		cursor_fg = isLatte and colors[palette].base or colors[palette].crust,
		cursor_bg = colors[palette].rosewater,
		cursor_border = colors[palette].rosewater,

		selection_fg = colors[palette].text,
		selection_bg = colors[palette].surface2,

		scrollbar_thumb = colors[palette].surface2,

		split = colors[palette].overlay0,

		ansi = {
			isLatte and colors[palette].subtext1 or colors[palette].surface1,
			colors[palette].red,
			colors[palette].green,
			colors[palette].yellow,
			colors[palette].blue,
			colors[palette].pink,
			colors[palette].teal,
			isLatte and colors[palette].surface2 or colors[palette].subtext1,
		},

		brights = {
			isLatte and colors[palette].subtext0 or colors[palette].surface2,
			colors[palette].red,
			colors[palette].green,
			colors[palette].yellow,
			colors[palette].blue,
			colors[palette].pink,
			colors[palette].teal,
			isLatte and colors[palette].surface1 or colors[palette].subtext0,
		},

		indexed = {
			[16] = colors[palette].peach,
			[17] = colors[palette].rosewater,
		},

		-- nightbuild only
		compose_cursor = colors[palette].flamingo,

		tab_bar = {
			background = colors[palette].crust,
			active_tab = {
				bg_color = colors[palette][accent],
				fg_color = colors[palette].crust,
			},
			inactive_tab = {
				bg_color = colors[palette].mantle,
				fg_color = colors[palette].text,
			},
			inactive_tab_hover = {
				bg_color = colors[palette].base,
				fg_color = colors[palette].text,
			},
			new_tab = {
				bg_color = colors[palette].surface0,
				fg_color = colors[palette].text,
			},
			new_tab_hover = {
				bg_color = colors[palette].surface1,
				fg_color = colors[palette].text,
				italic = true,
			},
		},

		visual_bell = colors[palette].surface0,
	}
end

local function select_for_appearance(appearance, options)
	if appearance:find("Dark") then
		return options.dark
	else
		return options.light
	end
end

function M.setup(c, opts)
	if not opts then
		opts = {}
	end

	-- default options
	local o = {
		flavor = opts.flavor or "mocha",
		accent = opts.accent or "blue",
		sync = opts.sync or false,
		sync_flavors = opts.sync_flavors or { light = "latte", dark = "mocha" },
	}

	-- fallback if no options are passed
	if c.color_schemes == nil then
		c.color_schemes = {}
	end

	-- insert all flavors
	for k, v in pairs(mappings) do
		c.color_schemes[v] = M.select(k, o.accent)
	end

	if opts.sync then
		c.color_scheme = select_for_appearance(wezterm.gui.get_appearance(), {
			dark = opts.sync_flavors.dark,
			light = opts.sync_flavors.light,
		})
		c.command_palette_bg_color = select_for_appearance(wezterm.gui.get_appearance(), {
			dark = colors[o.sync_flavors.dark].crust,
			light = colors[o.sync_flavors.light].crust,
		})
		c.command_palette_fg_color = select_for_appearance(wezterm.gui.get_appearance(), {
			dark = colors[o.sync_flavors.dark].text,
			light = colors[o.sync_flavors.light].text,
		})
	else
		c.color_scheme = mappings[o.flavor]
		c.command_palette_bg_color = colors[o.flavor].crust
		c.command_palette_fg_color = colors[o.flavor].text
	end
end

return M
