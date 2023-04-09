-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<Leader>gn"] = { "<Cmd>Neogit<CR>", desc = "Neogit" },
    ["<Leader>fg"] = {
      function() require("telescope").extensions.live_grep_args.live_grep_args() end,
      desc = "live grep",
    },
    ["<Leader>fb"] = {
      -- https://github.com/nvim-telescope/telescope-file-browser.nvim
      function() require("telescope").extensions.file_browser.file_browser() end,
      desc = "file browser",
    },
    ["[j"] = { "<Plug>(jumpcursor-jump)", desc = "jump" },
    ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<S-h>"] = { "<cmd>bprev<cr>", desc = "Prev Buffer" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-]>"] = { "<Plug>(skkeleton-toggle)", desc = "skk" },
  },
  c = {
    ["<C-]>"] = { "<Plug>(skkeleton-toggle)", desc = "skk" },
  },
}
