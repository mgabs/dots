<h1 align="center">My Nvim Configuration</h1>

<div align="center"><p>
    <a href="https://github.com/neovim/neovim">
      <img src="https://img.shields.io/badge/Neovim-0.9.0-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white" alt="Neovim"/>
    </a>
    <a href="https://github.com/Allaman/nvim/pulse">
      <img src="https://img.shields.io/github/last-commit/Allaman/nvim" alt="Last commit"/>
    </a>
    <a href="https://github.com/Allaman/nvim/issues">
      <img src="https://img.shields.io/github/issues/Allaman/nvim.svg?style=flat-square&label=Issues&color=F05F40" alt="Github issues"/>
    </a>
    <a href="https://github.com/Allaman/nvim/actions/workflows/ci.yml">
      <img src="https://github.com/Allaman/nvim/actions/workflows/ci.yml/badge.svg" alt="CI Status"/>
    </a>
    <a href="https://github.com/Allaman/nvim/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/Allaman/nvim?style=flat-square&logo=MIT&label=License" alt="License"/>
    </a>
</p>

</div>

![](./docs/screenshot.png)

💻 This configuration works on my [Manjaro](https://manjaro.org/) Linux as well as on my macOS and requires Neovim >= 0.10 for all features. If you are running Neovim 0.9, dropbar.nvim is disabled, which only works in Neovim >= 0.10

Have a look at my [rice](https://github.com/Allaman/rice) how my Linux machine is configured and at my [mac-setup](https://github.com/Allaman/mac-setup) how my MBP is configured. My [dotfiles](https://github.com/Allaman/dotfiles) are also on GitHub.

## More Screenshots

_Terminal_: alacritty

_Font_: Jetbrains Mono

<details>
<summary>Go development</summary>

![](./docs/go-dev.png)

</details>

<details>
<summary>Debugging via DAP</summary>

![](./docs/dap.png)

</details>

<details>
<summary>Hydra modes for better shortcut handling</summary>

![](./docs/hydra-window.png)
![](./docs/hydra-telescope.png)
![](./docs/hydra-spelling.png)

</details>

## Motivation

There are many great Neovim configurations (see [Inspiration](#inspiration)), that give you a pleasant experience right out of the box, available. However, I am a long time (Neo)Vim user with a specific workflow and needs. Additionally, I do not have any Lua background and was not willing to spent too much time into that. Therefore, it was quite hard for me to customize and strip down the existing configs to my needs especially because the code is quite sophisticated.

I decided to move to my own fresh Lua based Neovim from my good old vimrc trying to accomplish the following principles.

## Principles

1. Migrate to Lua based alternative plugins respectively use only Lua based plugins (if possible).
1. Keep the config as maintainable as possible knowing that this would possibly impact the code quality.
1. Modular and meaningful directory structure and file naming.
1. Just make it work and not make it beautiful 😃. Of course, Neovim itself must look beautiful, but my focus is not on beautiful code or on utilizing all Lua features.

## Features

### General ⚙️

- Package management and plugin configuration via [lazy.nvim](https://github.com/folke/lazy.nvim)
- Submodes powered by [Hydra.nvim](https://github.com/anuvyklack/hydra.nvim)
- Complete transformation via [noice.nvim](https://github.com/folke/noice.nvim)
- Fully featured status line via [mini.nvim](https://github.com/echasnovski/mini.nvim)
- Terminal integration via [nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)
- Fancy notifications via [nvim-notify](https://github.com/rcarriga/nvim-notify)
- Better writing with [ltex-ls](https://valentjn.github.io/ltex/index.html)
- Dashboard via [alpha.nvim](https://github.com/goolord/alpha-nvim) with recent files and quick links
- Multiple preconfigured themes like [catppuccin](https://github.com/catppuccin/nvim), [tokyonight](https://github.com/folke/tokyonight.nvim), [nightfox](https://github.com/EdenEast/nightfox.nvim), and more
- Health check via `checkhealth core`
- Fast startup < 150 ms 🚀

### Navigation 🧭

- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for all your search needs
- Project management with [Project.nvim](https://github.com/ahmedkhalf/project.nvim)
- File tree navigation/manipulation via [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Better Tmux navigation with your home row via [Navigator.nvim](https://github.com/numToStr/Navigator.nvim)
- Convenient jumping through windows with [nvim-window-picker](https://gitlab.com/s1n7ax/nvim-window-picker)

### Coding 🖥️

- Auto completion powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Built-in LSP configured via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason](https://github.com/williamboman/mason.nvim), and [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- Debugging for Go, Python, and Rust via [nvim-dap](https://github.com/mfussenegger/nvim-dap) and friends
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [Tresitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) for your syntax needs
- Auto formatting via [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Excellent Go support via LSP and [go.nvim](https://github.com/ray-x/go.nvim) including sensible keybindings
- Excellent Rust support via LSP and [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) including sensible keybindings
- Always know where you are in your code via [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- Git integration via [Neogit](https://github.com/TimUntersberger/neogit) and [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Outlining symbols with [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
- Snippets provided by [Luasnip](https://github.com/L3MON4D3/LuaSnip) and [friendly snippets](https://github.com/rafamadriz/friendly-snippets) with autocompletion
- Schema integration via LSPs for Kubernetes, package.json, GitHub workflows, gitlab-ci.yml, kustomization.yaml, and more
- GitHub Copilot integration via [copilot.lua](https://github.com/zbirenbaum/copilot.lua) (not enabled by default)

## Try out

If you have [Docker](https://www.docker.com/) on your system you can try out this configuration.

💡 Due to installing required tools like LSPs, CLI apps, etc. the image is approximately 3 GB large

### Dockerhub

There is a GitHub action in place that builds and pushes the Docker image to Dockerhub as `allaman/nvim`

#### Just start Neovim in container

```sh
docker run --name nvim --rm -it allaman/nvim
```

#### Mount a local directory (to ~/mount) and start Neovim

```sh
docker run --name nvim --rm -it -v ${HOME}/tmp:/home/nvim/mount allaman/nvim
```

#### Start container in bash instead of Neovim

```sh
docker run --name nvim --rm -it --entrypoint=/bin/bash allaman/nvim
```

### Build the image

You can also build the image on your own

```sh
docker build -t nvim .
```

Replace `allaman/nvim` in the former commands with just `nvim`.

## Installation

I created an installation [script](install.sh) that sets up all required tools on a fresh machine to work with my Neovim config.

For now, it works on Debian/Ubuntu and Arch. MacOS will be added soon.

USE AT YOUR OWN RISK!!

## Requirements

There are some tools that are required in order to use some features/plugins:

Run `:checkhealth core` to check the status.

### Tools

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)

For the neo-tree delete functionality:

- [trash-cli](https://github.com/andreafrancia/trash-cli)

For Latex functionality:

- [Tectonic](https://tectonic-typesetting.github.io/en-US/) (can be changed in `config.lua`)
- [Skim](https://skim-app.sourceforge.io/) (can be changed in `config.lua`)

### LSPs, Formatting, Linters, DAP

The following programs should be installed on your system so that the appropriate tools can be installed:

- Go
- Python
- NodeJs > 12
- Cargo

#### Go

Go related dependencies are managed by `go.nvim` and are installed by running `:GoInstallBinaries` (when a Go file is loaded). They are installed in your `$GOPATH`.

#### All other

All other dependencies are managed by [Mason](https://github.com/williamboman/mason.nvim). Tools are installed by running `:MasonToolsInstall` (in `vim.fn.std path("data") .. "mason"`). [Mason requirements](https://GitHub.com/William beman/mason.nvim#requirements) must be available on your system.

## Bindings

Leader key is `\` , the rest of the mappings are in `lua/keymaps`.

## Structure

`tree -L 1 .`

```sh
.
├── after            # file specific settings
├── init.lua         # main entry point
├── lazy-lock.json   # Lockfile for Lazy.nvim
├── lua/core         # lua configuration
├── snippets         # snippets directory (luasnip style)
└── spell            # my spell files linked from another repo
```

`tree -L 1 lua/core`

```sh
lua/core
├── config           # default config and user config handling
├── autocmd.lua      # autocmds for various things
├── globals.lua      # global functions
├── health.lua       # checkhealth implementation
├── lazy.lua         # Lazy configuration
├── mappings.lua     # key bindings
├── plugins          # plugins and their configuration
└── utils            # utility stuff
```

Each plugin to be installed is defined in `./lua/core/plugins/` in a separate file.

## User configuration

The intention of my Neovim configuration was never to be a fully customizable "distribution" like LunarVim, SpaceVim, etc. but from time to time I like to change my color scheme and the idea of making this configurable came to my mind. Based upon this idea I implemented some further lightweight configuration options that might be useful.

The default configuration can be found in `./lua/core/config/defaults.lua` which is just one rather large table. You can overwrite any of this configuration by writing a `.nvim_config.lua` file that follows the same structure as `defaults.lua` and pick only those keys that you want to modify. The configuration file should be placed in `$XDG_CONFIG_HOME`, `$HOME`, or the windows equivalent path.

You can start with `cp ./config-example.lua $HOME/.nvim_config.lua`.

## Remove plugins

You can remove unwanted plugins by just removing the appropriate file in `./lua/core/plugins/`. Lazy will take care of removing the plugin.

**Keep in mind that some plugins are configured to work in conjunction with other plugins. For instance, autopairs is configured in `./lua/vim/config/treesitter.lua`. For now there is no logic implemented that cross-checks such dependencies.**

## Add plugins

If you want to follow my method adding a plugin is straight forward:

Create a file in `./lua/core/plugins/` following the expected format of Lazy.

Open another instance of Neovim (I always try to keep one running instance of Neovim open in case I messed up my config) and run `Lazy sync`.

## Inspiration

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [SpaceVim](https://spacevim.org/)
- [Doom-nvim](https://github.com/NTBBloodbath/doom-nvim)
- [spf13-vim](https://github.com/spf13/spf13-vim)
- [NvChad](https://nvchad.github.io/)
- [Janus](https://github.com/carlhuda/janus)