local colorscheme = "sonokai"  -- https://github.com/sainnhe/sonokai

-- Sonokai configuration (placed before `colorscheme sonokai`)
-- See :help sonokai.txt
local g = vim.g

g.sonokai_style = "shusia"     -- ie. `let g:sonokai_style = "shusia"
g.sonokai_disable_italic_comment = 1
g.sonokai_transparent_background = 1


-- Use protected call
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-- Customization
local hi = {
  "Visual guibg=#49454A",
  "CursorLine guibg=#383539",
  "MatchParen guibg=#5C5A60 guifg=#E5C463",
  "LineNr guifg=#5C5A60"
}

for _, v in pairs(hi) do
  vim.cmd("highlight " .. v)
end