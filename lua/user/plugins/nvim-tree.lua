--[[ PLUGIN HOMEPAGE: https://github.com/kyazdani42/nvim-tree.lua ]]--

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  respect_buf_cwd = true,    -- change nvim-tree's cwd to that of new buffer's when opening nvim-tree

  -- Ignore files (Press `I` in menu to toggle ignore file visibility)
  filters = {
    dotfiles = false,        -- Don't show files starting with `.`
    custom = {
      ".git",
      "node_modules",
    }
  },

  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },

  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    },
  },

  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,  -- Ignore files based on .gitignore
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      -- Custom keybindings
      list = {
        { key = "b", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "x", cb = tree_cb "split" },
        { key = "t", cb = tree_cb "tabnew" },
      },
    },
    number = false,
    relativenumber = false,
  },
}
