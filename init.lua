--[[ Base ]]--
require "user/options"
require "user/keymaps"
require "user/autocommands"
require "user/colorscheme"

--[[ Plugins ]]--
require "user/plugins"

-- General
require "user/lsp"
require "user/plugins/completion"
require "user/plugins/gitsigns"
require "user/plugins/impatient"
require "user/plugins/project"
require "user/plugins/telescope"
require "user/plugins/treesitter"

-- Productivity
require "user/plugins/autopairs"
require "user/plugins/comment"
require "user/plugins/nvim-tree"
require "user/plugins/toggleterm"
require "user/plugins/whichkey"

-- Aesthetics
require "user/plugins/alpha"
require "user/plugins/bufferline"
require "user/plugins/indentline"
require "user/plugins/lualine"
