--[[
  This file contains plugins managed by "vim-plug".
  It's for installing Vimscript plugins that cannot be loaded by Lua-based "packer.nvim".
]]--

local Plug = vim.fn['plug#']

vim.call('plug#begin')
--------------------------------------------------------
---------------- START OF YOUR PLUGINS -----------------
--------------------------------------------------------

--[[ Productivity ]]--
Plug "tpope/vim-surround"            -- quickly manipulate surrounds (brackets, quotes, etc.)

--------------------------------------------------------
------------------ END OF YOUR PLUGINS -----------------
--------------------------------------------------------
vim.call('plug#end')