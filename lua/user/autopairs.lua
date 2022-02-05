--[[ Plugin homepage: https://github.com/windwp/nvim-autopairs ]]--

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  -- Treesitter
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },

  -- Note: Run ":echo &ft" to get file type
  disable_filetype = { "TelescopePrompt", "spectre_panel" },

  -- https://github.com/windwp/nvim-autopairs#fastwrap
  fast_wrap = {
    map = "<A-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}


-- Custom rules (Examples: https://github.com/windwp/nvim-autopairs/wiki/Custom-rules)
local Rule = require'nvim-autopairs.rule'

npairs.add_rules {
  -- Javascript: Auto-complete `/**` with `*/`
  Rule('/%*%*$', ' */', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
    :use_regex(true)
    :set_end_pair_length(3),
}


-- Integration with cmp (autocomplete)
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
