return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },	-- Global objects
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
