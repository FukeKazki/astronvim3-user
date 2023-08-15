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
  -- {
  --   "sigmasd/deno-nvim", -- add lsp plugin
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   {
  --     "williamboman/mason-lspconfig.nvim",
  --     opts = {
  --       -- ensure_installed = { "denols" }, -- automatically install lsp
  --     },
  --   },
  -- },
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
            globalDictionaries = {
              "~/.skk/SKK-JISYO.L",
              "~/.skk/skk-jisyo-emoji-ja.utf8",
              "~/.skk/SKK-JISYO.propernoun",
            },
          }
          -- jjでescape
          vim.fn["skkeleton#register_kanatable"]("rom", {
            ["jj"] = "escape",
          })
        end,
      })
    end,
  },
  {
    "Shougo/ddc.vim",
    lazy = false,
    dependencies = { "vim-denops/denops.vim", "Shougo/ddc-ui-native" },
    config = function()
      local patch_global = vim.fn["ddc#custom#patch_global"]
      -- UIに何を使うか
      patch_global("ui", "native")
      -- 補完候補を設定
      patch_global("sources", { "skkeleton" })
      patch_global("sourceOptions", {
        _ = {
          matchers = { "matcher_head" },
          sorters = { "sorter_rank" },
        },
        skkeleton = {
          mark = "skkeleton",
          matchers = { "skkeleton" },
          sorters = {},
          isVolatile = true,
          minAutoCompleteLength = 2,
        },
      })
      vim.fn["ddc#enable"]()
    end,
  },
  {
    -- 保管候補をだすプラグイン
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
    },
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 100 },
        { name = "luasnip", priority = 20 },
        { name = "buffer", priority = 20 },
        { name = "path", priority = 60 },
        { name = "emoji", priority = 60 }, -- add new source
      }
      -- return the new table to be used
      return opts
    end,
  },
  -- {
  --   name = "say-hello.nvim",
  --   dir = "/Users/fukke/Develop/github.com/fukke/say-hello.nvim",
  --   dev = true,
  --   lazy = false,
  --   config = function() require("say-hello").setup() end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    build = "cd app && yarn install",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    lazy = false,
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-e>",
          },
        },
      }
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    version = "*",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end,
    version = "*",
    event = "VeryLazy",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    version = "*",
    event = "VeryLazy",
  },
  {
    "pwntester/octo.nvim",
    config = function() require("octo").setup() end,
    event = "VeryLazy",
  },
  {
    "skanehira/denops-docker.vim",
    version = "*",
    event = "VeryLazy",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function() require("neogit").setup {} end,
  },
}
