return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    setup_handlers = {
      -- add custom handler
      denols = function(_, opts) require("deno-nvim").setup { server = opts } end,
    },
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "package.json"
        opts.single_file_support = false
        return opts
      end,
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
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
  jsonls = {
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { "deno.json", "deno.jsonc" },
            url = "https://deno.land/x/deno/cli/schemas/config-file.v1.json",
          },
        },
      },
    },
  },
  yamlls = {
    -- override table for require("lspconfig").yamlls.setup({...})
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
    vim.opt.runtimepath:prepend { "/Users/fuke/Develop/github.com/fuke/denops-chatgpt.vim/" }

    -- Normal と NormalNC のハイライト設定を変数に代入
    -- local color_normal = vim.api.nvim_get_hl_by_name("Normal", true)
    -- local color_normal_nc = vim.api.nvim_get_hl_by_name("NormalNC", true)

    -- vim.api.nvim_set_hl(0, "Normal", {
    --   ctermbg = 'NONE'
    -- })
    -- vim.api.nvim_set_hl(0, "NonText", {
    --   ctermbg = 'NONE'
    -- })
    -- vim.api.nvim_set_hl(0, "LineNr", {
    --   ctermbg = 'NONE'
    -- })
    -- vim.api.nvim_set_hl(0, "Folded", {
    --   ctermbg = 'NONE'
    -- })
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", {
    --   ctermbg = 'NONE'
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
