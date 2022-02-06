--[[ PLUGIN HOMEPAGE: https://github.com/nvim-lualine/lualine.nvim ]]--

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 85
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
  symbols = { error = " ", warn = " ", hint = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- Row and col
local location = {
	"location",
	padding = 1,
}

local filename = {
  "filename",
  path = 1,     -- 0: Just the file name ; 1: Relative path ; 2: Absolute path
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "sonokai",
		component_separators = { left = "", right = " " },
    section_separators = { left = '', right = ''},
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, diagnostics },
		lualine_c = { filename },
		lualine_x = { "fileformat", "filetype" },
		lualine_y = { diff },
		lualine_z = { location, progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
