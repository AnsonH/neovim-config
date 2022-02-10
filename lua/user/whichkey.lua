local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,           -- shows a list of your marks on ' and `
    registers = true,       -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,      -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20,     -- no. of suggestions to show
    },

    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,    -- help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,      -- help for motions
      text_objects = true,  -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = false,            -- bindings for prefixed with g
    },
  },

  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },

  -- override the label used to display some keys. It doesn't effect WK in any other way.
  key_labels = {
    -- For example:
    -- ["<space>"] = "SPC",
  },
  icons = {
    breadcrumb = "»",       -- symbol used in the command line area that shows your active key combo
    separator = "",        -- symbol used between a key and it's label
    group = "",           -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>",  -- binding to scroll down inside the popup
    scroll_up = "<c-u>",    -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",     -- none, single, double, shadow
    position = "bottom",    -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,            -- spacing between columns
    align = "left",         -- align columns left, center or right
  },
  ignore_missing = true,    -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", ":", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,         -- show help message on the command line when the popup is visible
  triggers = "auto",        -- automatically setup triggers
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

--[[ DEFINE NEW KEYBINDINGS ]]--

local n_leader_opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
}

-- Create new mappings that begins with <leader>
local n_leader_mappings = {
  ["b"] = {
    ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { ":NvimTreeToggle<cr> :IndentBlanklineEnable<CR>", "Explorer" },
  ["w"] = { ":Alpha<cr>", "Welcome" },

  p = {
    name = " Packer",
    c = { ":PackerCompile<cr>", "Compile" },
    i = { ":PackerInstall<cr>", "Install" },
    s = { ":PackerSync<cr>", "Sync" },
    S = { ":PackerStatus<cr>", "Status" },
    u = { ":PackerUpdate<cr>", "Update" },
  },

  g = {
    name = " Git",
    p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
    b = { ":lua require'gitsigns'.blame_line{full=true}<CR>", "Blame" },
    j = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
    k = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },

    r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
    R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" },
    s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },

    o = { ":Telescope git_status<cr>", "Open changed file" },
    B = { ":Telescope git_branches<cr>", "Checkout branch" },
    c = { ":Telescope git_commits<cr>", "Checkout commit" },
  },

  l = {
    name = " LSP",
    a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },

    d = {
      ":lua vim.diagnostic.setloclist()<CR>",
      "Document Diagnostics",
    },
    w = {
      ":lua require'telescope.builtin'.diagnostics(telescope_expanded_dropdown())<CR>",
      "Workspace Diagnostics",
    },

    -- LSP Installer
    i = { ":LspInfo<cr>", "Info" },
    I = { ":LspInstallInfo<cr>", "Installer Info" },
  },

  s = {
    name = " Search",
    h = { ":Telescope highlights<cr>", "Highlights" },
    H = { ":Telescope help_tags<cr>", "Help Tags" },
    r = { ":Telescope oldfiles<cr>", "Open Recent File" },
    k = { ":Telescope keymaps<cr>", "Keymaps" },
  },
}

local n_g_opts = {
  mode = "n",     -- NORMAL mode
  prefix = "g",
}

local n_g_mappings = {
  -- LSP
  d = { ":lua vim.lsp.buf.definition()<CR>", " Go to Definition" },
  i = { ":lua vim.lsp.buf.implementation()<CR>", " Go to Implementation" },
  h = { ":lua vim.lsp.buf.hover()<CR>", " Hover Tooltip" },
  l = {
    ":lua vim.diagnostic.open_float({border='rounded'})<CR>",
    " Open Diagnostics"
  },
  r = {
    ":lua require'telescope.builtin'.lsp_references(telescope_expanded_dropdown(16))<CR>",
    " Show References"
  },

  -- Misc
  f = "Go to File",
  x = "Open File with System App",
}

which_key.setup(setup)
which_key.register(n_leader_mappings, n_leader_opts)
which_key.register(n_g_mappings, n_g_opts)
