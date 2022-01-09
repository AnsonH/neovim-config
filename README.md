# Neovim Config

Adapted from [Neovim from Scratch](https://www.youtube.com/playlist?list=plhoh5vyxr6qq41nfl4gvhfp-wld5xzizz) playlist.

## Installation

### Prerequisites

> ⚠️ Requires Neovim v0.6.0 or greater

Before installation, make sure that the following directories are empty:

Windows:

- `C:\Users\<User>\AppData\Local\nvim`
- `C:\Users\<User>\AppData\Local\nvim-data`

Linux:

- `~/.config/nvim`
- `~/.local/share/nvim`

If these directories already exist, you can rename them (eg. `nvim` to `nvim.old`).

### Steps

1. Clone this repository:

   ```bash
   # Windows
   cd C:\Users\<User>\AppData\Local
   git clone https://github.com/AnsonH/neovim-config nvim

   # Linux
   git clone https://github.com/AnsonH/neovim-config ~/.config/nvim
   ```

2. Open Neovim with `nvim`. It will automatically install plugins
3. After installing plugins, re-open Neovim.
4. (TBC: Install LSP?)
