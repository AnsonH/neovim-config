--[[
  PLUGIN HOMEPAGE: https://github.com/akinsho/bufferline.nvim
]]--

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",                     -- ordinal" | "buffer_id" | "both"
    separator_style = "padded_slant",     -- "slant" | "padded_slant" | "thick" | "thin"

    close_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",     -- Choose buffer on left click
    right_mouse_command = "Bdelete! %d",  -- Close buffer on right click
    middle_mouse_command = nil,

    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,

    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",           -- Close tab
    left_trunc_marker = "",
    right_trunc_marker = "",

    max_name_length = 21,
    max_prefix_length = 18,     -- prefix used when a buffer is de-duplicated
    tab_size = 21,

    diagnostics = "nvim_lsp",   -- false | "nvim_lsp" | "coc"
    diagnostics_indicator = function(count, level)
      return "("..count..")"
    end,

    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },

  highlights = {
    buffer_selected = {
      gui = "bold",
    },
    diagnostic_selected = {
      gui = "bold",
    },
  },
}