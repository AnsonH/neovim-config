--[[ Extra configurations for minor plugins ]]--

local g = vim.g

-- norcalli/nvim-colorizer.lua (Color preview)
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup({
  "*",    -- Highlight all files, but customize some others.
  lua = { names = false },
}, { names = false })

-- sbdchd/neoformat
g.neoformat_try_node_exe = 1          -- attempt to find exe in a node_modules/.bin
g.neoformat_only_msg_on_error = 1

-- Neovide GUI https://github.com/neovide/neovide/wiki/Configuration
g.neovide_cursor_animation_length = 0
g.neovide_refresh_rate = 60
