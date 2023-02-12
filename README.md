# Neovim config

## Setup

- Download this repo

  ```bash
  cd ~/.config
  git clone https://github.com/AnthonyDugarte/nvim.git --depth 1
  ```

- Restart nvim

## Requirements

- NVim
- NerdFont (icons)
- catimg (telescope img preview)

## Configs

### clangd : c/cpp lsp suggestions

In order for clangd to generate appropiate suggestions, it's necessary to generate a `compile_commands.json`. On way to do it is via [bear](https://github.com/rizsotto/Bear):

```sh
bear -- make
```

## TODOS

- [x] File tree
  - [x] Install nvim-tree
  - [x] Install nerd font
  - [x] Add keymaps
- [x] File + terminal switching
  - [x] Basic toggleterm config
  - [x] keymaps
- [x] Add status line
  - [x] Install lualine
  - [x] Use default config
- [x] Add colorscheme
  - [x] Tokyonight
- [x] Tabs
  - [x] Install bufferline
  - [x] Use default config
  - [x] Offset with nvim-tree
  - [x] Configure navigation keymaps
- [x] Telescope
  - [x] Install
  - [x] Basic configuration
- [x] Treesitter
  - [x] Install + setup default config
  - [x] Autotag plugin
- [x] LSP
  - [x] mason automatic lspconfig install
  - [x] add ts + lua servers
  - [x] Add cmp
  - [x] Add null-ls
- [x] DAP
  - [x] cpp
