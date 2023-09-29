return {
  "rebelot/heirline.nvim",
  opts = function()
    local status = require "astronvim.utils.status"
    local utils = require "heirline.utils"

    local TablineBufnr = {
      provider = function(self) return tostring(self.bufnr) .. ". " end,
      hl = function(self)
        if self.is_active then
          return {}
        else
          return {
            fg = "gray",
          }
        end
      end,
    }

    -- we redefine the filename component, as we probably only want the tail and not the relative path
    local TablineFileName = {
      provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
      end,
      hl = function(self)
        if self.is_active then
          return {
            bold = true,
            fg = "NONE",
          }
        else
          return {
            bold = false,
            fg = "gray",
          }
        end
      end,
    }

    -- this looks exactly like the FileFlags component that we saw in
    -- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
    -- also, we are adding a nice icon for terminal buffers.
    local TablineFileFlags = {
      {
        condition = function(self) return vim.api.nvim_buf_get_option(self.bufnr, "modified") end,
        provider = "[+]",
        hl = { fg = "green" },
      },
      {
        condition = function(self)
          return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
            or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
          if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
            return "  "
          else
            return ""
          end
        end,
        hl = { fg = "orange" },
      },
    }
    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self) return self.icon and (self.icon .. " ") end,
      hl = function(self) return { fg = self.icon_color } end,
    }
    -- Here the filename block finally comes together
    local TablineFileNameBlock = {
      init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
      hl = {
        bg = "NONE",
      },
      on_click = {
        callback = function(_, minwid, _, button)
          if button == "m" then -- close on mouse middle click
            vim.schedule(function() vim.api.nvim_buf_delete(minwid, { force = false }) end)
          else
            vim.api.nvim_win_set_buf(0, minwid)
          end
        end,
        minwid = function(self) return self.bufnr end,
        name = "heirline_tabline_buffer_callback",
      },
      TablineBufnr,
      FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
      TablineFileName,
      TablineFileFlags,
    }

    -- The final touch!
    -- local TablineBufferBlock = { TablineFileNameBlock, TablineCloseButton }
    local TablineBufferBlock = utils.surround({ " ", " " }, function(self)
      if self.is_active then
        return "NONE"
      else
        return utils.get_highlight("TabLine").bg
      end
    end, {
      TablineFileNameBlock,
    })

    -- and here we go
    local BufferLine = utils.make_buflist(
      TablineBufferBlock,
      { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
      { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
      -- by the way, open a lot of buffers and try clicking them ;)
    )

    local WorkDir = {
      init = function(self)
        self.icon = " "
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
      end,
      hl = { fg = "gray" },
      flexible = 1,
      {
        -- evaluates to the full-lenth path
        provider = function(self)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. self.cwd .. trail .. " "
        end,
      },
      {
        -- evaluates to the shortened path
        provider = function(self)
          local cwd = vim.fn.pathshorten(self.cwd)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. cwd .. trail .. " "
        end,
      },
      {
        -- evaluates to "", hiding the component
        provider = "",
      },
    }
    return {
      statusline = {
        -- 一番下にでてる
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        WorkDir,
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        {
          -- SKKが有効な時にSKKという文字を表示する
          hl = {},
          provider = "SKK有効",
          condition = function() return vim.fn["skkeleton#is_enabled"]() end,
        },
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.mode { surround = { separator = "right" } },
      },
      winbar = { -- ウィンドウごとにでてる
        status.component.file_info { filename = {} },
      },
      tabline = { -- 一番上にでてる
        {
          -- file tree padding
          -- TreeSitterの分paddingを表示する
          condition = function(self)
            self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
            return status.condition.buffer_matches(
              { filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" } },
              vim.api.nvim_win_get_buf(self.winid)
            )
          end,
          provider = function(self) return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1) end,
          hl = { bg = "NONE" },
        },

        BufferLine,
      },
    }
  end,
}
