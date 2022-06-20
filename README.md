<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/wez/wezterm">WezTerm</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
	<a href="https://github.com/catppuccin/wezterm/stargazers"><img src="https://img.shields.io/github/stars/catppuccin/wezterm?colorA=363a4f&colorB=b7bdf8&style=for-the-badge style=for-the-badgestyle=for-the-badge"></a>
	<a href="https://github.com/catppuccin/wezterm/issues"><img src="https://img.shields.io/github/issues/catppuccin/wezterm?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
	<a href="https://github.com/catppuccin/wezterm/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/wezterm?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="./assets/WezTerm.png"/>
</p>

## Usage

1. Clone this repository locally, or download [catppuccin.lua](https://raw.githubusercontent.com/catppuccin/wezterm/main/catppuccin.lua) directly.
2. If you're on a POSIX system: create a directory named `~/.config/wezterm/colors`, if you're on Windows, create a directory named `colors` in the same directory as the `wezterm.exe` (usually `C:\Program Files\WezTerm`).
3. Move `catppuccin.lua` to the `colors` directory you created in step 2.
4. Open your WezTerm config file (on a POSIX system: `~/.wezterm.lua` or `~/.config/wezterm/wezterm.lua`; on Windows: `wezterm.lua` in the same directory as the `wezterm.exe`).
   The WezTerm config file has the following structure:

```lua
local wezterm = require("wezterm")

return {
	-- your config
	-- ...
}
```

5. Add these lines:

```lua
local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup {}

return {
	-- your config
	-- ...
	colors = catppuccin,
}
```

6. (Optional) Tweak the config to your liking, these are the default values:
```lua
local catppuccin = require("colors/catppuccin").setup {
	-- whether or not to sync with the system's theme
	sync = true,
	-- the flavours to switch between when syncing
	-- available flavours: "latte" | "frappe" | "macchiato" | "mocha"
	sync_flavours = {
		light = "latte",
		dark = "mocha"
	},
	-- the default/fallback flavour, when syncing is disabled
	flavour = "mocha"
}
```

7. Enjoy!

## 💝 Thanks to

-	[Pocco81](https://github.com/Pocco81)
-	[LudoPinelli](https://github.com/LudoPinelli)
-	[winston](https://github.com/nekowinston)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
