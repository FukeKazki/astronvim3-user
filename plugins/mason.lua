-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "denols", "tsserver", "jsonlsp", "yaml-language-server", "tailwindcss", "rome" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      handlers = {
        -- eslintrcファイルがある場合のみ有効にする
        eslint_d = function()
          local null_ls = require "null-ls"
          -- diagnotics, code_actions, formattingそれぞれ設定する
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
            condition = function(util) return util.root_has_file ".eslintrc.json" or util.root_has_file ".eslintrc.js" end,
          })
          null_ls.register(null_ls.builtins.code_actions.eslint_d.with {
            condition = function(util) return util.root_has_file ".eslintrc.json" or util.root_has_file ".eslintrc.js" end,
          })
          null_ls.register(null_ls.builtins.formatting.eslint_d.with {
            condition = function(util) return util.root_has_file ".eslintrc.json" or util.root_has_file ".eslintrc.js" end,
          })
        end,
        -- prettierrcファイルがある場合のみ有効にする
        prettier = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.formatting.prettier.with {
            condition = function(util)
              return util.root_has_file ".prettierrc.json" or util.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- romeファイルがある場合のみ有効にする
        rome = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.formatting.rome.with {
            condition = function(util) return util.root_has_file "rome.json" end,
          })
        end,
        -- stylelintrcファイルがある場合のみ有効にする
        stylelint = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.diagnostics.stylelint.with {
            condition = function(util)
              return util.root_has_file ".stylelintrc.json" or util.root_has_file ".stylelintrc.js"
            end,
          })
        end,
      },
      automatic_installation = true,
      automatic_setup = true,
      ensure_installed = { "prettier", "stylua", "eslint_d", "rome", "stylelint" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- handlers = {
      --   python = function(source_name)
      --     local dap = require "dap"
      --     dap.adapters.python = {
      --       type = "executable",
      --       command = "/opt/homebrew/bin/python3",
      --       args = {
      --         "-m",
      --         "debugpy.adapter",
      --       },
      --     }
      --
      --     dap.configurations.python = {
      --       {
      --         type = "python",
      --         request = "launch",
      --         name = "Launch file",
      --         program = "${file}", -- This configuration will launch the current file if used.
      --       },
      --     }
      --   end,
      -- },
      ensure_installed = { "python" },
    },
  },
}
