local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require "telescope.actions"

---------[[ LOAD YOUR TELESCOPE EXTENSIONS HERE ]]----------

-- telescope.load_extension('media_files')

------------[[ END OF TELESCOPE EXTENSIONS ]]--------------

--[[ Custom Telescope themes ]]--
telescope_expanded_dropdown = function(height)
  local menu_height = height or 20

  return {
    layout_strategy = "center",   -- See ":h telescope.layout" -> Scroll to "layout_strategies.center()"
    layout_config = {
      preview_cutoff = 1,         -- Preview should always show (unless previewer = false)
      width = 0.88,
      height = menu_height,       -- No. of rows for Prompt + Results
    },
    results_title = false,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  }
end

--[[ Keymaps to launch Telescope ]]--
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap(
  "n",
  "<C-p>",    -- Find files
  ":lua require'telescope.builtin'.find_files(require'telescope.themes'.get_dropdown{ previewer=false })<CR>",
  opts
)
keymap(
  "n",
  "<C-f>",    -- Buffer fuzzy find
  ":lua require'telescope.builtin'.current_buffer_fuzzy_find(telescope_expanded_dropdown())<CR>",
  opts
)
keymap(
  "n",
  "<A-f>",    -- Live grep (fuzzy find across whole directory)
  ":lua require'telescope.builtin'.live_grep(telescope_expanded_dropdown())<CR>",
  opts
)
-- keymap(
--   "n",
--   "gfd",    -- File diagnostics
--   ":lua require'telescope.builtin'.diagnostics({ bufnr=0 , unpack(telescope_expanded_dropdown()) })<CR>",  -- For Lua 5.2, `unpack()` becomes `table.unpack()`
--   opts
-- )
keymap(
  "n",
  "gwd",    -- Workspace diagnostics
  ":lua require'telescope.builtin'.diagnostics(telescope_expanded_dropdown())<CR>",
  opts
)
keymap(
  "n",
  "gr",    -- Show LSP references
  ":lua require'telescope.builtin'.lsp_references(telescope_expanded_dropdown(16))<CR>",
  opts
)


--[[ Setup ]]--
telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },   -- See ":h telescope.defaults.path_display"

    -- More on Lua Regex: https://www.lua.org/manual/5.1/manual.html#5.4.1
    file_ignore_patterns = { "%a.lock" },

    -- Layout strategies - ":h telescope.layout"
    -- Default config - ":h telescope.defaults.layout_config"
    layout_config = {
      horizontal = {
        width = 0.85
      },
    },

    --[[ NOTE: These mappings ONLY apply when Telescope is ON!! ]]--
    mappings = {
      -- INSERT MODE
      i = {
        ["<Esc>"] = actions.close,    -- Quit in insert mode

        ["<C-j>"] = actions.move_selection_next,
        ["<Down>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-_>"] = actions.which_key,                    -- "Ctrl + /" -> Show available keybindings

        ["<C-Down>"] = actions.cycle_history_next,        -- Cycle next item in history
        ["<C-Up>"] = actions.cycle_history_prev,          -- Cycle previous item in history

        ["<C-u>"] = actions.preview_scrolling_up,         -- Preview window scroll up ("u" = up)
        ["<C-d>"] = actions.preview_scrolling_down,       -- Preview window scroll down ("d" = down)
        ["<PageUp>"] = actions.results_scrolling_up,      -- Result window scroll up
        ["<PageDown>"] = actions.results_scrolling_down,  -- Result window scroll down
 
        ["<A-h>"] = actions.select_horizontal,            -- Open selected item in new horizontal split window
        ["<A-v>"] = actions.select_vertical,              -- Open selected item in new vertical split window
        ["<A-t>"] = actions.select_tab,                   -- Open selected item in new tab

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,           -- Send all entries to quickfix list
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  -- Send selected entry to quickfix list
        -- ["<C-l>"] = actions.complete_tag,
      },

      -- NORMAL MODE
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["?"] = actions.which_key,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,         -- Preview window scroll up ("u" = up)
        ["<C-d>"] = actions.preview_scrolling_down,       -- Preview window scroll down ("d" = down)
        ["<PageUp>"] = actions.results_scrolling_up,      -- Result window scroll up
        ["<PageDown>"] = actions.results_scrolling_down,  -- Result window scroll down

        ["<A-h>"] = actions.select_horizontal,            -- Open selected item in new horizontal split window
        ["<A-v>"] = actions.select_vertical,              -- Open selected item in new vertical split window
        ["<A-t>"] = actions.select_tab,                   -- Open selected item in new tab

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    highlights = {
      theme = "dropdown",
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
