--[[ Comment Plugin: https://github.com/numToStr/Comment.nvim
  DEFAULT KEYBINDINGS: https://github.com/numToStr/Comment.nvim#-usage

  CUSTOM KEYBINDINGS:
   - "Ctrl + /"  : Toggle linewise comment in NORMAL or VISUAL mode
]]--

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  -- Compute commentstring using Treesitter (https://github.com/numToStr/Comment.nvim#-hooks)
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

--[[ Custom Keybindings ]]--

local function keymap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- # NORMAL Mode

-- Linewise toggle current line using C-/
keymap('n', '<C-_>', ':lua require("Comment.api").toggle_current_linewise()<CR>')

-- # VISUAL mode

-- Linewise toggle using C-/
keymap('x', '<C-_>', '<ESC>:lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')