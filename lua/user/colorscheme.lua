--[[
  Sonokai - Shusia variant palette:
   - Foreground: #e3e1e4
   - Background: #2d2a2e
   - Red:    #f85e84
   - Orange: #ef9062
   - Yellow: #e5c463
   - Green:  #9ecd6f
   - Blue:   #7accd7
   - Purple: #ab9df2
]]--

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
  "Visual guibg=#365154",
  "CursorLine guibg=#383539",
  "LineNr guifg=#67676D",
  "ScrollView guibg=#adadad",     -- nvim-scrollview (scroll bar)

  -- Code: General
  "MatchParen guibg=#515155",
  "CurrentWord guibg=#515155",    -- Highlight current word

  -- Code: Language Specific
  "javaScriptNull guifg=#ab9df2",

  -- Code: Treesitter
  "TSConstant guifg=#ab9df2",
  "TSConstructor guifg=#7accd7",
  "TSParameter guifg=#ef9062",
  "TSText guifg=#e3e1e4",         -- HTML tag inner text
  "TSTag guifg=#f85e84",          -- HTML tag name
  "TSTagAttribute guifg=#7accd7", -- HTML tag attribute
}

for _, v in pairs(hi) do
  vim.cmd("highlight " .. v)
end
