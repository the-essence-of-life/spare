require("telescope").setup({
  defaults = {
    mappings = {
      i = {},
    },
  },
  pickers = {},
  extensions = {
    command_palette = {
      {
        "File",
        { "entire selection (C-a)",  ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ":w" },
        { "save all files (C-A-s)",  ":wa" },
        { "quit (C-q)",              ":qa" },
        { "file browser (C-i)",      ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)",       ":lua require('telescope.builtin').live_grep()",                  1 },
        { "git files (A-f)",         ":lua require('telescope.builtin').git_files()",                  1 },
        { "files (C-f)",             ":lua require('telescope.builtin').find_files()",                 1 },
      },
      {
        "Help",
        { "tips",            ":help tips" },
        { "cheatsheet",      ":help index" },
        { "tutorial",        ":help tutor" },
        { "summary",         ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {
        "Vim",
        { "reload vimrc",              ":source $MYVIMRC" },
        { "check health",              ":checkhealth" },
        { "jumps (Alt-j)",             ":lua require('telescope.builtin').jumplist()" },
        { "commands",                  ":lua require('telescope.builtin').commands()" },
        { "command history",           ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)",           ":lua require('telescope.builtin').registers()" },
        { "colorshceme",               ":lua require('telescope.builtin').colorscheme()",    1 },
        { "vim options",               ":lua require('telescope.builtin').vim_options()" },
        { "keymaps",                   ":lua require('telescope.builtin').keymaps()" },
        { "buffers",                   ":Telescope buffers" },
        { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
        { "paste mode",                ":set paste!" },
        { "cursor line",               ":set cursorline!" },
        { "cursor column",             ":set cursorcolumn!" },
        { "spell checker",             ":set spell!" },
        { "relative number",           ":set relativenumber!" },
        { "search highlighting (F12)", ":set hlsearch!" },
      }
    },
    file_browser = {
      theme = "dropdown",
      display_stat = { date = true, size = true, mode = false },
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    lazy = {
      -- Optional theme (the extension doesn't set a default theme)
      theme = "ivy",
      -- Whether or not to show the icon in the first column
      show_icon = true,
      -- Mappings for the actions
      mappings = {
        open_in_browser = "<C-o>",
        open_in_file_browser = "<M-b>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_plugins_picker = "<C-b>", -- Works only after having called first another action
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
      },
      -- Other telescope configuration options
    },
    frecency = {
      db_root = "~/",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"] = "~/.config/",
        ["data"] = "~/.local/share/",
        ["project"] = "~/workspace/",
      },
    },
    menu = {
      default = {
        items = {
          { "󱠀  Editor",                      "Telescope menu editor" },
          -- You can add an item of menu in the form of { "<display>", "<command>" }
          { "  Checkhealth",                  "checkhealth" },
          { "  Show LSP Info",                "LspInfo" },
          { "  Files",                        "Telescope find_files" },
          { "󰗼  Exit",                        "wqa!" },

          -- The above examples are syntax-sugars of the following;
          { display = "  Change colorscheme", value = "Telescope colorscheme" },
        },
      },
      editor = {
        items = {
          { " Split window vertically",   "vsplit" },
          { " Split window horizontally", "split" },
          { "󰙏 Write",                    "w" },
          { " Filetype Options",          "Telescope menu filetype" },
        },
      },
      filetype = {
        lua = {
          items = {
            { "󰉶 Format",                   "!stylua %" },
            -- { "Open Luadev menu", "Luadev" },
            { "󰶭 Execute a current buffer", "LuaRun" },
          },
        },
        sh = {
          items = {
            { " Run Terminal", "ToggleTerm" },
          },
        },
      },
    },
  },
})
