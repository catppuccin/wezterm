<h3 align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
  Catppuccin for <a href="https://github.com/wez/wezterm">WezTerm</a>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
  <a href="https://github.com/catppuccin/wezterm/stargazers"><img src="https://img.shields.io/github/stars/catppuccin/wezterm?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
  <a href="https://github.com/catppuccin/wezterm/issues"><img src="https://img.shields.io/github/issues/catppuccin/wezterm?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
  <a href="https://github.com/catppuccin/wezterm/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/wezterm?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="./assets/screen.webp"/>
</p>

## Usage

Catppuccin is now [included in WezTerm](https://wezfurlong.org/wezterm/colorschemes/c/index.html#catppuccin-frappe).

1. Edit your `wezterm.lua`.
2. Set `color_scheme` to your preferred flavor.

```lua
return {
  -- ...your existing config
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
}
```

3. (Optional) To enable syncing with your OS theme, use
   `wezterm.gui.get_appearance()`

```lua
local wezterm = require "wezterm"

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

return {
  -- ...your existing config
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
```

## 🙋 FAQ

- Q: **_"How can I set custom color overrides?"_**
  \
  A: Use
  [`wezterm.color.get_builtin_schemes()`](https://wezfurlong.org/wezterm/config/lua/wezterm.color/get_builtin_schemes.html)
  like this:

```lua
local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

return {
  color_schemes = {
    ["OLEDppuccin"] = custom,
  },
  color_scheme = "OLEDppuccin",
}
```

## 💝 Thanks to

- [Pocco81](https://github.com/Pocco81)
- [LudoPinelli](https://github.com/LudoPinelli)
- [winston](https://github.com/nekowinston)
- [wez](https://github.com/wez)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
