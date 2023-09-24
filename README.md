<div align="center">

# _Spare-Nvim

<!-- <a href='https://postimg.cc/QKgRcR6R' target='_blank'><img src='https://i.postimg.cc/QKgRcR6R/IMG-20230501-192206.jpg' border='0' alt='IMG-20230501-192206'/></a> -->
![Stitch_20230619_193741.png](https://img1.imgtp.com/2023/06/19/vFQahSB5.png)

<!-- ### 此 space-nvim 非彼 spacevim -->

</div>

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

---

## 📑 Content
- [🎉 Feature](#-feature)
- [📡 Dependencies](#-dependencies)
- [💻 Setup](#-setup)
- [📋 Plugins List](#-plugins-list)
- [➕ Add New Plugins](#-add-new-plugins)
- [🛠 Maintain your configuration](#-maintain-your-configuration)
- [👋 Thanks So](#-thanks-so)

---

## 🎉 Feature

make file:(Not gcc,shell script.)
`cd ~/.config/nvim/`  
- `make sync`:Sync the latest plugins(Ensure that the network is smooth,depends on git).
- `make update`:Update to latest config(depends on git).
- `make debug`:Debug your neovim(Only applicable to versions above 10.0).
- `make clean-cache`:Delete your all neovim local plugins.(Use with caution)
- `make set-options`:Quick switch the config directory.
- `make add-plugins`:Quick switch the plugins directory.

---

## 📡 Dependencies

<!-- <img height="12" width="12" src="https://cdn.simpleicons.org/<name>/<colors>" /> -->
**Must:**  
&ensp;&ensp;[nerdfont](https://www.nerdfonts.com/font-downloads) (To show the terminal icons.)  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/neovim/00A500" /> `neovim` >= `0.9.0`  
&ensp;&ensp;_Comment:_ In the future, version 0.83 will be adapted.  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/git/D76C00" /> `git` >= `2.41.0`  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/c/4E93D7" /> `clang(treesitter need)` >= `3.26.4`  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/nodedotjs/1EA51E" /> `nodejs(mason need)` >= `19.*`
&ensp;`luajit` >= 2.1.0-beta3

**Oprional:**  
&ensp;&ensp;`fd` >= `8.7.0`  
&ensp;&ensp;`rg(ripgrep)` >= `8.7.0`
&ensp;&ensp;`shellcheck`,`shellharden`(Grammer check)

**You can use linux package manager to install it.**  
**For example:`pacman`,`pkg`,`apt`,`dnf` and so on.**

---


## 💻 Setup

**Step1** Backup your config and remove your caches.

```bash
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/
```

**Step2** Clone this repo,ensure that dependencies are installed correctly.
```bash
git clone --depth=1 https://github.com/the-essence-of-life/space-nvim/ ~/.config/nvim/

```

**Step3** Then,set configruation.  
`cd ~/.config/nvim/lua/spare/`  
`nvim init.lua`  
```lua
local M = {}

M.setup = function()
require("spare.utils").setup({
  options = {
    basic = false,
    vimplugins = false
  },
  keymaps = {
    enabled = false
  },
  autocmds = {
    lastplace = false,
    directory = false,
  },
  plugin = {
    mode = nil,
  },
})
end

return M
```
<details>
  <summary>default configruation</summary>

  ```lua
  require("spare.config").setup({
    options = {
      basic = true,
      vimplugins = true
    },
    keymaps = {
      enabled = true
    },
    autocmds = {
      lastplace = true,
    },
    plugin = {
      enabled = true,
    },
  })
  ```
  ```lua
  require("spare.utils").setup({
    options = {
      enabled = true,
      vimplugins = true,
      settings = {
        autowrite = true,           -- Enable auto write
        clipboard = "unnamedplus",  -- Sync with system clipboard
        completeopt = "menu,menuone,noselect",
        conceallevel = 3,           -- Hide * markup for bold and italic
        confirm = true,             -- Confirm to save changes before exiting modified buffer
        cursorline = true,          -- Enable highlighting of the current line
        expandtab = true,           -- Use spaces instead of tabs
        formatoptions = "jcroqlnt", -- tcqj
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --vimgrep",
        ignorecase = true,      -- Ignore case
        inccommand = "nosplit", -- preview incremental substitute
        laststatus = 0,
        list = true,            -- Show some invisible characters (tabs...
        mouse = "a",            -- Enable mouse mode
        number = true,          -- Print line number
        pumblend = 10,          -- Popup blend
        relativenumber = true,  -- Relative line numbers
        scrolloff = 4,          -- Lines of context
        sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
        shiftround = true,      -- Round indent
        shiftwidth = 2,         -- Size of an indent
        --	shortmess:append({ W = true, I = true, c = true }),
        showmode = false,       -- Dont show mode since we have a statusline
        sidescrolloff = 8,      -- Columns of context
        signcolumn = "yes",     -- Always show the signcolumn, otherwise it would shift the text each time
        smartcase = true,       -- Don't ignore case with capitals
        smartindent = true,     -- Insert indents automatically
        spelllang = { "en" },
        splitbelow = true,      -- Put new windows below current
        splitright = true,      -- Put new windows right of current
        tabstop = 2,            -- Number of spaces tabs count for
        termguicolors = true,   -- True color support
        timeoutlen = 300,
        undofile = true,
        undolevels = 10000,
        swapfile = false,
        wildmode = "longest:full,full", -- Command-line completion mode
        winminwidth = 5,                -- Minimum window width
        wrap = false,                   -- Disable line wrap
      },
    },
    keymaps = {
      enabled = true,
      { mode = "n", keys = "<c-c>", exec = "<cmd>wq<cr>" },
      -- n = {},
      -- v = {},
    },
    autocmds = {
      lastplace = false,
      directory = false,
      -- { event = "", pattern = "", callback = function() end },
    },
    plugin = {
      -- [comment] string:plugin-manager,plugins
      mode = "plugin-manager",
    },
  })
  ```

</details>


**Tips**  
You can use `<c-v>` to select the line

**Step4** Final,start your neovim.  
`nvim`

---


## ➕ Add New Plugins

You can see examples [here](https://github.com/folke/lazy.nvim#examples).  
**Step1** Edit init.lua(for example:`ui/`)
`nvim ~/.config/nvim/lua/bin/plugins/ui/init.lua`  

**Step2** Then copy these code to `noice.lua`(run:`nvim noice.lua`)

```lua
return {
  -- [comment] Github url,dependencies are same reason.
  -- e.g: https://github.com/folke/noice.nvim => "folke/noice.nvim"
  "folke/noice.nvim", --[[use ","]]
  -- [comment] Packer on 'requires' function are change on 'dependencies',to see more information,you can go to the url to see more information.
  dependencies = {},
  -- [comment] (event,ft,keys,cmd) are lazy-loading settings.
  event = "VeryLazy",
  -- [comment] (config,init,cond) are configruation settings.
  config = function()
    require("spare.plugins.user.noice")
  end,
}
-- i to insert,<Esc> can quit the insert mode.
-- Then :wq to save the files.
```

**Step3** Edit a config file(We will suggestions to put in plugins setup function in this file)  
`nvim noice.lua`  
```lua
require("noice").setup({
  -- configruation
})

```

**Step4** Finally,reply `nvim` in your terminal again,you'll find these packages are auto installed.

---

## 🛠 Maintain your configuration

### Change your package manager

First,find `init.lua`:
```bash
## If use default config:
nvim ~/.config/nvim/lua/bin/init.lua

## If use user config:
nvim ~/.config/nvim/lua/user/init.lua
```

Finally,change the line:
```lua
---...
    plugin = {
      mode = "plugin-manager",
    },
---...
```

### Language Support

- Front-end full Language  
<img height="36" width="36" src="https://cdn.simpleicons.org/html5/FF632E" /> <img height="36" width="36" src="https://cdn.simpleicons.org/css3/5DFFFF" /> <img height="36" width="36" src="https://cdn.simpleicons.org/javascript/FFAE5D" /> <img height="36" width="36" src="https://cdn.simpleicons.org/typescript/46B9FF" />

- <img height="14" width="14" src="https://cdn.simpleicons.org/c/17A8FF" /> C-family full Language
> **Note** To support it,you'll copy these code to your neovim configruation.  You can [Click here](./lua/bin/plugins/lsp/lsp-settings.lua#L77) to view the code.

```lua
-- ~/.config/nvim/lua/bin/plugins/lsp/lsp-settings.lua
require("lspconfig").clangd.setup{}

```

- <img height="14" width="14" src="https://cdn.simpleicons.org/lua/5DAEFF" /> Lua(needs to install `lua-language-server` in your terminal.)

### Add a new language language-server

**Step1** Input `:Mason` in your neovim.  
**Step2** `<c-f>` search language-server,for example:bash,and type Enter.Type 2 to swtich lsp.  
**Step3** Input "i" to install the language-server,type Enter to view the information.
**Step4** Add some code-snippets in your configruation.  
**NOTE**  
You can [click it](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) to view more information.  
You can also input `:help lspconfig-all` in your neovim.


### plugins
[lsp](./lua/spare/plugins/lsp/) | [tools](./lua/bin/plugins/tools/) | [user](./lua/bin/plugins/user/) | [utils](./lua/bin/plugins/utils/) | [ui](./lua/bin/plugins/ui/)


### change user plugins directory(`make set-options`,`make set-uoptions`,`make add-plugins`,`make add-uplugins` are same.)
`nvim ~/.config/nvim/Makefile`  
`14jA`  
```bash
  set-options:
    nvim ~/.config/nvim/lua/bin/config/ => nvim <your-path>
  add-plugins:
    nvim ~/.config/nvim/lua/bin/plugins/ => nvim <your-path>
  set-uoptions:
    nvim ~/.config/nvim/lua/user/config/ => nvim <your-path>
  add-uplugins:
    nvim ~/.config/nvim/lua/user/plugins/ => nvim <your-path>
```
### treesitter grammer install
`:TSInstall <language>`  

### add colorscheme
`nvim ~/.config/nvim/lua/spare/plugins/ui/init.lua`

### file directory
```
lua
├── spare
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   ├── init.lua
└───└── plugins
        ├── lsp
        │   ├── README.md
        │   ├── cmp.lua
        │   ├── init.lua
        │   ├── lsp-format.lua
        │   ├── lsp-settings.lua
        │   ├── lspsaga.lua
        │   ├── mason-lspconfig.lua
        │   ├── mason-null-ls.lua
        │   ├── null-ls.lua
        │   └── typescript.lua
        ├── tools
        │   ├── README.md
        │   ├── autoclose.lua
        │   ├── ccc.lua
        │   ├── init.lua
        │   ├── jfind.lua
        │   ├── map.lua
        │   ├── markdown.lua
        │   ├── neotree.lua
        │   ├── nvim-tree.lua
        │   ├── overseer.lua
        │   ├── spectre.lua
        │   ├── tabnine.lua
        │   ├── telescope.lua
        │   ├── todo-comments.lua
        │   ├── toggleterm.lua
        │   ├── trouble.lua
        │   ├── ufo.lua
        │   └── vgit.lua
        ├── ui
        │   ├── README.md
        │   ├── alpha.lua
        │   ├── barbar.lua
        │   ├── catppuccin.lua
        │   ├── cursorline.lua
        │   ├── dashboard.lua
        │   ├── heirline.lua
        │   ├── indent-blankline.lua
        │   ├── init.lua
        │   ├── lualine.lua
        │   ├── lualine.lua.bak
        │   ├── quickui.lua
        │   ├── staline.lua
        │   └── wilder.lua
        ├── user
        │   ├── README.md
        │   └── init.lua
        └── utils
            ├── README.md
            ├── autopairs.lua
            ├── fine-cmdline.lua
            ├── harpoon.lua
            ├── init.lua
            ├── noice.lua
            ├── nui.lua
            ├── persistence.lua
            └── treesitter.lua
```

### commit bug
spare is a very freedom configruation,so you may backup your configruation and continue.

---

## 👋 THANKS SO

@eggtoopain

> All the people who helped me.  
> No need money!Love make lights!
