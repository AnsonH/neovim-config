--[[
  PLUGIN HOMEPAGE: https://github.com/lewis6991/gitsigns.nvim
]]--

local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add          = { hl = "GitSignsAdd"   , text = "▎", numhl = "GitSignsAddNr"   , linehl = "GitSignsAddLn" },
    change       = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete       = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete    = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },

  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,     -- Highlight line number, Toggle with `:Gitsigns toggle_numhl`
  linehl = false,    -- Highlight entire line, Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : ':Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : ':Gitsigns prev_hunk<CR>'"},

    ['n <leader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['n <leader>hu'] = ':Gitsigns undo_stage_hunk<CR>',
    ['n <leader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['n <leader>hR'] = ':Gitsigns reset_buffer<CR>',
    ['n <leader>hp'] = ':Gitsigns preview_hunk<CR>',
    ['n <leader>hb'] = ':lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>hS'] = ':Gitsigns stage_buffer<CR>',
    ['n <leader>hU'] = ':Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },

  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false,     -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",        -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,         -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}