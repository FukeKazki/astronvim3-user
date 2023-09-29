return {
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {},
  },
  colorscheme = "tokyonight",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    setup_handlers = {
      -- add custom handler
      -- denols = function(_, opts) require("deno-nvim").setup { server = opts } end,
    },
    -- config = {
    -- romeファイルがある場合のみ有効にする
    -- rome = function(opts)
    --   opts.root_dir = require("lspconfig.util").root_pattern "rome.json"
    --   opts.single_file_support = false
    --   return opts
    -- end,
    -- },
    config = {
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "package.json"
        opts.single_file_support = false
        return opts
      end,
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        opts.single_file_support = false
        return opts
      end,
      jsonls = {
        settings = {
          json = {
            schemas = {
              {
                fileMatch = { "deno.json", "deno.jsonc" },
                url = "https://deno.land/x/deno/cli/schemas/config-file.v1.json",
              },
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json",
              },
            },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
            },
          },
        },
      },
    },
    -- システムに直接インストールされているLSPを有効にする
    -- textlintとか？
    servers = {},
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.filetype.add {
      extension = {
        mdx = "markdown",
      },
      -- filename = {
      --   ["Foofile"] = "fooscript",
      -- },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
    }
    -- 自作プラグインのパスを通す
    -- vim.opt.runtimepath:prepend { "~/.config/nvim/lua/myplugins/dps-helloworld/" }
    -- vim.opt.runtimepath:prepend { "/Users/fuke/Develop/github.com/fuke/denops-chatgpt.vim/" }
    -- Normal と NormalNC のハイライト設定を変数に代入
    -- local color_normal = vim.api.nvim_get_hl_by_name("Normal", true)
    -- local color_normal_nc = vim.api.nvim_get_hl_by_name("NormalNC", true)
    --
    -- vim.api.nvim_set_hl(0, "Normal", {
    --   ctermbg = "NONE",
    -- })
    -- vim.api.nvim_set_hl(0, "NonText", {
    --   ctermbg = "NONE",
    -- })
    -- vim.api.nvim_set_hl(0, "LineNr", {
    --   ctermbg = "NONE",
    -- })
    -- vim.api.nvim_set_hl(0, "Folded", {
    --   ctermbg = "NONE",
    -- })
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", {
    --   ctermbg = "NONE",
    -- })
    -- Neovim からフォーカスか外れた時に Normal の色を NormalNC にして
    -- フォーカスが戻った時に Normal に戻す
    -- vim.api.nvim_create_autocmd({ "FocusLost" }, {
    --   pattern = { "*" },
    --   callback = function()
    --     vim.api.nvim_set_hl(0, "Normal", { fg = color_normal_nc.foreground, bg = color_normal_nc.background })
    --   end,
    -- })
    -- vim.api.nvim_create_autocmd({ "FocusGained" }, {
    --   pattern = { "*" },
    --   callback = function()
    --     vim.api.nvim_set_hl(0, "Normal", { fg = color_normal.foreground, bg = color_normal.background })
    --   end,
    -- })
  end,
}
