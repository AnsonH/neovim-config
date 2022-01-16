--[[
  - SCROLL DOWN TO "START OF YOUR PLUGINS" comment block to install plguins.
  - Run :PackerInstall to install plugins

  - We use "packer.nvim" as the plugin manager: https://github.com/wbthomason/packer.nvim
    - Example: https://github.com/wbthomason/packer.nvim#quickstart
    - Plugins are installed at:
      - Windows: C:\Users\<User>\AppData\Local\nvim-data\site\pack\packer\start
      - Linux: ~/.local/share/nvim/site/pack/packer/start
]]--

require("user.plugins.extra-config")
require("user.plugins.vim-plug")

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- Instead of doing `local packer = require("packer")`
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"        -- Have packer manage itself
  use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"         -- Useful lua functions used by lots of plugins
  use 'kyazdani42/nvim-web-devicons'  -- For plugins to add file icons
  use "moll/vim-bbye"                 -- delete buffers without closing the window
  use "lewis6991/impatient.nvim"      -- improve startup time

  --------------------------------------------------------
  ---------------- START OF YOUR PLUGINS -----------------
  --------------------------------------------------------

  --[[ Syntax highlighting & Colors ]]--
  use "sainnhe/sonokai"
  use "norcalli/nvim-colorizer.lua"   -- color highlighter

  --[[ Auto-completion ]]--
  use "hrsh7th/nvim-cmp"              -- completion engine
  use "hrsh7th/cmp-buffer"            -- buffer completions (~words in same file)
  use "hrsh7th/cmp-path"              -- path completions
  use "hrsh7th/cmp-cmdline"           -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"      -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"          -- LSP completions
  use "hrsh7th/cmp-nvim-lua"          -- Neovim Lua API completions

  --[[ Snippets ]]--
  use "L3MON4D3/LuaSnip"              -- snippet engine
  use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

  --[[ LSP (Language Server Protocol) ]]--
  use "neovim/nvim-lspconfig"         -- enable LSP
  use "williamboman/nvim-lsp-installer"    -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim"    -- for formatters and linters

  --[[ Telescope ]]--
  use "nvim-telescope/telescope.nvim" -- core plugin

  --[[ Treesitter ]]--
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow"          -- rainbow brackets
  use "nvim-treesitter/playground"    -- view Tresitter information
  use "JoosepAlviste/nvim-ts-context-commentstring"     -- comments for embedded languages

  --[[ Productivity ]]--
  use "windwp/nvim-autopairs"         -- autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag"        -- auto tags for HTML/JSX/PHP...
  use "numToStr/Comment.nvim"         -- easily comment code
  use "kyazdani42/nvim-tree.lua"      -- file explorer
  use "akinsho/toggleterm.nvim"       -- toggle terminal window

  --[[ Git ]]--
  use "lewis6991/gitsigns.nvim"       -- git signs

  --[[ Aesthetics ]]--
  use "dstein64/nvim-scrollview"      -- scroll bar
  use "akinsho/bufferline.nvim"       -- buffer line at the top
  use 'nvim-lualine/lualine.nvim'     -- status line at the bottom

  --------------------------------------------------------
  ------------------ END OF YOUR PLUGINS -----------------
  --------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
