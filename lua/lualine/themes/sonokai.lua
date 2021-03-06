-- =============================================================================
-- Modified from: https://github.com/sainnhe/sonokai/blob/master/lua/lualine/themes/sonokai.lua
-- =============================================================================

local configuration = vim.fn['sonokai#get_configuration']()
local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)

return {
  normal = {
    a = {bg = palette.bg_blue[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.diff_blue[1], fg = palette.fg[1]},
    c = {bg = palette.bg1[1], fg = "#afaeb0"},
    y = {bg = palette.bg3[1], fg = palette.fg[1]},
  },
  insert = {
    a = {bg = palette.bg_green[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.diff_green[1], fg = palette.fg[1]},
  },
  visual = {
    a = {bg = palette.bg_red[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.diff_red[1], fg = palette.fg[1]},
  },
  replace = {
    a = {bg = palette.orange[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = "#5d433b", fg = palette.fg[1]},
  },
  command = {
    a = {bg = palette.yellow[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = palette.diff_yellow[1], fg = palette.fg[1]},
  },
  terminal = {
    a = {bg = palette.purple[1], fg = palette.bg0[1], gui = 'bold'},
    b = {bg = "#443f56", fg = palette.fg[1]},
  },
  inactive = {
    a = {bg = palette.bg1[1], fg = palette.grey[1]},
    b = {bg = palette.bg1[1], fg = palette.grey[1]},
  }
}
