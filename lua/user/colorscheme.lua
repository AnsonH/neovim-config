--[[
  Sonokai - Shusia variant palette:
   - fg:         #e3e1e4
   - bg0 ~ bg4:  #2d2a2e ; #37343a ; #3b383e ; #423f46 ; #49464e
   - Rainbow:    #f85e84 ; #ef9062 ; #e5c463 ; #9ecd6f ; #7accd7 ; #ab9df2
   - Color BG:   #55393d ; #5d433b ; #4e432f ; #394634 ; #354157 ; #443f56
   - grey, grey_dim, black: #848089 ; #605d68 ; #1a181a
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
  "CursorLine guibg=#3b383e",
  "DiffChange guibg=#5d433b",
  "IndentBlanklineChar guifg=#423f46",  -- indentation guide
  "LineNr guifg=#67676D",
  "ScrollView guibg=#67676D",           -- Scroll bar
  "Visual guibg=#365154",

  -- Code: General
  "CurrentWord guibg=#515155",          -- Highlight current word
  "MatchParen guibg=#515155",

  -- Code: Language Specific
  "javaScriptNull guifg=#ab9df2",

  -- Code: Treesitter
  "TSConstant guifg=#ab9df2",
  "TSConstructor guifg=#7accd7",
  "TSParameter guifg=#ef9062",
  "TSText guifg=#e3e1e4",               -- HTML tag inner text
  "TSTag guifg=#f85e84",                -- HTML tag name
  "TSTagAttribute guifg=#7accd7",       -- HTML tag attribute

  -- Git
  "GitSignsChange guifg=#ef9062",
  "GitSignsChangeNr guifg=#ef9062",

  -- nvim-tree (File explorer)
  "NvimTreeFolderName guifg=#7accd7",
  "NvimTreeEmptyFolderName guifg=#7accd7",
  "NvimTreeOpenedFolderName guifg=#7accd7",
}

for _, v in pairs(hi) do
  vim.cmd("highlight " .. v)
end
