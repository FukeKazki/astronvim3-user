return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua" },
    rainbow = {
      enable = true,
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
  },
}
