-- Go to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
-- Expand "Available settings" toggle menu for all settings

return {
	settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic"  -- Example
      }
    }
	},
}
