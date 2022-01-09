--[[ 
	Run :LspInstallInfo to open nvim-lsp-installer. Press `i` to install a server
]]--

-- neovim/nvim-lspconfig
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer") 		-- ./lsp-installer.lua
require("user.lsp.handlers").setup()	-- ./handlers.lua