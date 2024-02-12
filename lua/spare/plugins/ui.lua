local Index = require("spare.plugins.index.ui")

return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      Index.catppuccin()
      local color = color or "catppuccin"
      vim.cmd.color(color)
    end,
  },
  -- {
  --   'marko-cerovac/material.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.material_style = "palenight"
  --     require('material').setup({
  --       contrast = {
  --         terminal = false,            -- Enable contrast for the built-in terminal
  --         sidebars = false,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
  --         floating_windows = false,    -- Enable contrast for floating windows
  --         cursor_line = false,         -- Enable darker background for the cursor line
  --         non_current_windows = false, -- Enable contrasted background for non-current windows
  --         filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
  --       },
  --       styles = {                     -- Give comments style such as bold, italic, underline etc.
  --         comments = { --[[ italic = true ]] },
  --         strings = { --[[ bold = true ]] },
  --         keywords = { --[[ underline = true ]] },
  --         functions = { --[[ bold = true, undercurl = true ]] },
  --         variables = {},
  --         operators = {},
  --         types = {},
  --       },
  --       plugins = { -- Uncomment the plugins that you use to highlight them
  --         -- Available plugins:
  --         -- "dap",
  --         -- "dashboard",
  --         -- "eyeliner",
  --         -- "fidget",
  --         -- "flash",
  --         "gitsigns",
  --         -- "harpoon",
  --         -- "hop",
  --         -- "illuminate",
  --         -- "indent-blankline",
  --         "lspsaga",
  --         "mini",
  --         -- "neogit",
  --         -- "neotest",
  --         "neo-tree",
  --         -- "neorg",
  --         "noice",
  --         "nvim-cmp",
  --         -- "nvim-navic",
  --         -- "nvim-tree",
  --         "nvim-web-devicons",
  --         -- "rainbow-delimiters",
  --         -- "sneak",
  --         "telescope",
  --         "trouble",
  --         "which-key",
  --         -- "nvim-notify",
  --       },
  --       disable = {
  --         colored_cursor = false, -- Disable the colored cursor
  --         borders = false,        -- Disable borders between verticaly split windows
  --         background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
  --         term_colors = true,     -- Prevent the theme from setting terminal colors
  --         eob_lines = true       -- Hide the end-of-buffer lines
  --       },
  --       high_visibility = {
  --         lighter = false,    -- Enable higher contrast text for lighter style
  --         darker = false      -- Enable higher contrast text for darker style
  --       },
  --       async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
  --     })
  --     vim.cmd 'colorscheme material'
  --   end
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   init = function ()
  --     vim.cmd("colorscheme tokyonight-storm")
  --   end
  -- },
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return icon .. " " .. count
          end,
        },
      })
    end,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    'echasnovski/mini.indentscope',
    opts = { enable_match = false, kw = { "lazy" } },
    dependencies = {
      'echasnovski/mini.nvim'
    },
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        draw = {
          delay = 100,
          priority = 2,
        },
        options = {
          border = 'both',
          indent_at_cursor = true,
          try_as_border = false,
        },
        symbol = '│',
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = { enable_match = false, kw = { "lsp", "treesitter" } },
    config = function()
      local config = require("spare.plugins.index.alpha").config
      require("alpha").setup(config)
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'material',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },
}
