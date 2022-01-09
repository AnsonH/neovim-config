local colorscheme = "sonokai"  -- https://github.com/sainnhe/sonokai

-- Sonokai configuration (placed before `colorscheme sonokai`)
-- See :help sonokai.txt
local g = vim.g

g.sonokai_style = "shusia"     -- ie. `let g:sonokai_style = "shusia"
g.sonokai_disable_italic_comment = 1


-- Use protected call
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-- Customization
local hi = {
  -- GUI
  "Visual guibg=#2E4447",
  "CursorLine guibg=#383539",
  "LineNr guifg=#67676D",
  "ScrollView guibg=#adadad",   -- nvim-scrollview (scroll bar)

  -- Code
  "MatchParen guibg=#515155 guifg=#E5C463",
  "CurrentWord guibg=#515155",  -- Highlight current word
}

for _, v in pairs(hi) do
  vim.cmd("highlight " .. v)
end