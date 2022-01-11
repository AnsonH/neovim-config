--[[ Extra configurations for minor plugins ]]--

local g = vim.g

-- norcalli/nvim-colorizer.lua (Color preview)
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup{
  lua = { names = false },
}

-- Neovide GUI https://github.com/neovide/neovide/wiki/Configuration
g.neovide_cursor_animation_length = 0.08
g.neovide_refresh_rate = 50