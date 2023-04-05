return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local lga_actions = require "telescope-live-grep-args.actions"
    return {
      defaults = {
        -- 30%透明にする
        winblend = 30,
      },
      extensions = {
        -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-m>"] = lga_actions.quote_prompt(),
            },
          },
        },
      },
    }
  end,
}
