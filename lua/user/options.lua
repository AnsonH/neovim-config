-- Toggle relative line numbers when enter normal mode
vim.cmd [[autocmd InsertEnter * :set norelativenumber]]
vim.cmd [[autocmd InsertLeave * :set relativenumber]]

vim.cmd [[set guifont=FiraCode\ NF:h14.5]] -- Font for Neovide GUI
vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]               -- Treat words with `-` as single word (eg. Press `dw` on `foo-bar` deletes entire word)
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]   -- Disable auto comments on new line

local options = {
  -- Misc
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  timeoutlen = 400,                        -- time in ms for a mapped sequence to complete
  updatetime = 300,                        -- time for CursorHold command (wait time beofre highlighting current word)

  -- GUI
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  cursorline = true,                       -- highlight the current line
  mouse = "a",                             -- enable mouse control
  showmode = false,                        -- hide Insert, Replace, or Visual mode at status line
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  completeopt = { "menuone", "noselect" }, -- completion pop-up menu
  pumheight = 10,                          -- pop up menu height

  -- Line display
  scrolloff = 8,                           -- Min. no. of lines to keep above and below cursor
  sidescrolloff = 8,                       -- Min. no. of colums to scroll horizontally
  wrap = false,                            -- display lines as one long line

  -- File
  fileencoding = "utf-8",                  -- the encoding written to a file
  backup = false,                          -- don't create backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- dont' create swapfile
  undofile = true,                         -- enable persistent undo

  -- Line number
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}

  -- Tabs & Indentation
  expandtab = true,                        -- convert tabs to spaces
  autoindent = true,                       -- auto indent
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  showtabline = 2,                         -- always show tabs

  -- Search
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- override 'ignorecase' option if search pattern contains upper case characters
}

-- Setting up
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
