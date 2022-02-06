--[[ PLUGIN HOMEPAGE: https://github.com/goolord/alpha-nvim ]]--

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local logo = {
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

local function open_config()
  if vim.fn.has('macunix') == 1 then
    return ":e ~/.config/nvim/init.lua <CR>"
  else
    return ":e ~/AppData/Local/nvim/init.lua <CR>"
  end
end

-- https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/dashboard.lua
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = logo

dashboard.section.buttons.val = {
  dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
  dashboard.button("p", "  Projects", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
  dashboard.button("c", "  Configuration", open_config()),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  local date = os.date(" %Y-%m-%d")
  local version = vim.version()
  local nvim_version_info = " " .. version.major .. "." .. version.minor .. "." .. version.patch
  local github = " AnsonH"

  return date .. "   " .. nvim_version_info .. "   " .. github
end

dashboard.section.footer.val = footer()

-- Section colors
dashboard.section.header.opts.hl = "Red"
dashboard.section.buttons.opts.hl = "Red"   -- Not working for some reason
dashboard.section.footer.opts.hl = "Green"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)