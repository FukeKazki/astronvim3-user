return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- 特定の文字間をいじったりするやつ
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("neogit").setup() end,
  },
  {
    -- Denoでvimプラグインが動作するようになるやつ
    "vim-denops/denops.vim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    -- slackに投稿するプラグイン
    "FukeKazki/denops-slack.vim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    "sigmasd/deno-nvim", -- add lsp plugin
    version = "*",       -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "denols" }, -- automatically install lsp
      },
    },
  },
  {
    -- carbonをつかって画像化するプラグイン
    "kristijanhusak/vim-carbon-now-sh",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    -- 遷移を楽にするプラグイン
    "skanehira/jumpcursor.vim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
}
