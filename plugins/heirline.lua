return {
  "rebelot/heirline.nvim",
  opts = function()
    local status = require "astronvim.utils.status"
    return {
      statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        {
          -- SKKが有効な時にSKKという文字を表示する
          hl = {},
          provider = 'SKK有効',
          condition = function()
            return vim.fn['skkeleton#is_enabled']()
          end
        },
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
    }
  end
}
