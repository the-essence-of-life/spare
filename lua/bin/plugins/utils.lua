return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      "windwp/nvim-ts-autotag",
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("bin.plugins.utils.treesitter")
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  -- 	"windwp/nvim-autopairs",
  -- 	config = function()
  -- 		require("bin.plugins.utils.autopairs")
  -- 	end,
  -- },
  {
    "folke/noice.nvim",
    config = function()
      require("bin.plugins.utils.noice")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      {
        "MunifTanjim/nui.nvim",
        config = function()
          -- require("bin.plugins.utils.nui")
        end,
      },
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/persistence.nvim",
    -- event = "BufReadPre",   -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    config = function()
      require("bin.plugins.utils.persistence")
    end,
  },
  -- {
  -- 	"VonHeikemen/fine-cmdline.nvim",
  -- 	keys = {
  -- { ":", mode = "n" },
  -- },
  -- dependencies = {
  -- 	{ "MunifTanjim/nui.nvim" },
  -- },
  -- config = function()
  -- 	require("bin.plugins.utils.fine-cmdline")
  -- require("bin.plugins.utils.nui")
  -- 	end,
  -- },
  {
    "stevearc/dressing.nvim",
    config = true,
  },
}