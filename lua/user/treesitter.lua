local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,             -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,                  -- false will disable the whole extension
    disable = { "" },               -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  autopairs = {                -- https://github.com/windwp/nvim-autopairs
		enable = true,
	},
  autotag = {                  -- https://github.com/windwp/nvim-ts-autotag
    enable = true,
  },
  context_commentstring = {    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    enable = true,
    enable_autocmd = false,
  },

  --[[ `nvim-ts-rainbow` plugin (Rainbow brackets) ]]--
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" } -- list of languages you want to disable the plugin for
    extended_mode = true,      -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,      -- Do not enable for files with more than n lines, int
    -- colors = {},            -- table of hex strings
    -- termcolors = {}         -- table of colour name strings
  },

  --[[ `nvim-treesitter/playground` plugin (View treesitter info) ]]--
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  
  -- List of parsers to ignore installing
  -- Full list of language names: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ignore_install = {                
    "beancount",
    "bibtex",
    "c_sharp",
    "clojure",
    "commonlisp",
    "cuda",
    "devicetree",
    "dot",
    "elixir",
    "erlang",
    "fennel",
    "fish",
    "foam",
    "glsl",
    "gdscript",
    "gdresource",
    "hcl",
    "julia",
    "ocaml",
    "ocaml_interface",
    "ocamllex",
    "perl",
    "pioasm",
    "rasi",
    "scala",
    "sparql",
    "supercollider",
    "surface",
    "teal",
    "tlaplus",
    "zig",
  },          
}
