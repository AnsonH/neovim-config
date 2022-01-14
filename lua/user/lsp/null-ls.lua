--[[
  PLUGIN HOMEPAGE: https://github.com/jose-elias-alvarez/null-ls.nvim
]]--

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- Supported formatters: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- Supported linters: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,    -- Enable logging (:NullLsLog)

  --[[
    IMPORTANT NOTE:
     - Please make sure the formatter/linters are installed GLOBALLY and you can run them in the Terminal.
      - eg. To see if it runs "eslint_d", try `:echo executable("eslint_d")`
      - Echos "1" -> available ; Echos "0" -> not available
  ]]--
  sources = {
    -- Examples:
    -- formatting.black.with { extra_args = { "--fast" } },
    -- formatting.stylua,
    -- diagnostics.flake8,

    --[[ NOTE: Neovim has a bug where it adds ^M at end of formatted lines on Windows.
         https://github.com/neovim/neovim/issues/17053

         Hence, I used "sbdchd/neoformat" to invoke formatters instead of null-ls.
    ]]--

    -- formatting.prettier,
    -- diagnostics.eslint_d,     -- eslint_d works must faster than eslint
  },
}