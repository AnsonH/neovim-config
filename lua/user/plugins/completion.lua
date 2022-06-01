--[[
  Autocompleting engine: https://github.com/hrsh7th/nvim-cmp

  KEYBINDINGS FOR AUTO-COMPLETION:
   - <Tab>   : Select item
   - <C-j>   : Go to next menu item
   - <C-k>   : Go to previous menu item
   - <C-u>   : Scroll up the preview menu at the right ("u" = up)
   - <C-d>   : Scroll down the preview menu at the right ("d" = down)
   - <C-e>   : Exit autocomplete menu
]]--

-- Protected calls for "hrsh7th/nvim-cmp" and "luasnip" plugins
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

-- Editor area setup
cmp.setup({
  -- Snippet engine (use luasnip)
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- Keymaps
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }), -- Scroll up preview menu
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),  -- Scroll down preview menu
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),  -- NOT WORKING for some reason
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })  -- Accept first item if none is selected
      elseif luasnip.expandable() then  -- Snippet is accepted
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  -- Formatting of menu item
  formatting = {
    fields = { "kind", "abbr" },  -- Display icon first, then the abbreviation
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      return vim_item
    end,
  },
  -- Order of snippets to show
  sources = {
    { name = "nvim_lsp" },  -- LSP
    { name = "luasnip" },   -- Snippets
    { name = "path" },      -- Path
    { name = 'nvim_lua' },  -- Neovim Lua API
    { name = "buffer" },    -- Buffer
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },
  experimental = {
    ghost_text = true,   -- Inline preview of autocomplete text
    native_menu = false,
  },
})

-- `:` cmdline setup
cmp.setup.cmdline(':', {
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})
