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
  {
    "barrett-ruth/import-cost.nvim",
    version = "*",
    event = "VeryLazy",
    build = "sh install.sh yarn",
    config = function() require("import-cost").setup() end,
  },
  {
    -- 行ごとにgitblameを表示するプラグイン
    "f-person/git-blame.nvim",
    version = "*",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("todo-comments").setup() end,
  },
  {
    "nvim-treesitter/playground",
    version = "*",
    event = "VeryLazy",
  },
  {
    -- 翻訳するプラグイン
    "skanehira/denops-translate.vim",
    version = "*",
    event = "VeryLazy",
  },
  {
    -- 文字列を切り替える
    "AndrewRadev/switch.vim",
    version = "*",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "file_browser" end,
  },
  {
    "vim-skk/skkeleton",
    lazy = false,
    dependencies = { "vim-denops/denops.vim" },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"] {
            eggLikeNewline = true,
            registerConvertResult = true,
            globalJisyo = "~/Develop/SKK-JISYO.L",
          }
        end,
      })
    end,
  },
}
