return {
  -- this table overrides highlights in all themes
  -- Normal = { bg = "#000000" },
  -- 背景透過のための設定
  -- ハイライトが定義されているのを探して消す！
  -- https://neovim.io/doc/user/api.html#nvim_set_hl()
  -- fg (or foreground): color name or "#RRGGBB", see note.
  -- bg (or background): color name or "#RRGGBB", see note.
  -- sp (or special): color name or "#RRGGBB"
  -- blend: integer between 0 and 100
  -- bold: boolean
  -- standout: boolean
  -- underline: boolean
  -- undercurl: boolean
  -- underdouble: boolean
  -- underdotted: boolean
  -- underdashed: boolean
  -- strikethrough: boolean
  -- italic: boolean
  -- reverse: boolean
  -- nocombine: boolean
  -- link: name of another highlight group to link to, see :hi-link.
  -- default: Don't override existing definition :hi-default
  -- ctermfg: Sets foreground of cterm color ctermfg
  -- ctermbg: Sets background of cterm color ctermbg
  -- cterm: cterm attribute map, like highlight-args. If not set, cterm attributes will match those from the attribute map documented above.
  Normal = {
    ctermbg = "NONE",
  },
  NormalNC = {
    ctermbg = "NONE",
  },
  NonText = {
    ctermbg = "NONE",
  },
  LineNr = {
    ctermbg = "NONE",
  },
  Folded = {
    ctermbg = "NONE",
  },
  EndOfBuffer = {
    ctermbg = "NONE",
  },
  NeoTreeNormal = {
    ctermbg = "NONE",
  },
  NeoTreeNormalNC = {
    ctermbg = "NONE",
  },
  TabLine = {
    bg = "NONE",
  },
  TabLineFill = {
    bg = "NONE",
  },
  TabLineSel = {
    bg = "NONE",
  },
  StatusLine = {
    bg = "NONE",
  },
  WinBar = {
    bg = "NONE",
  },
  WinBarNC = {
    bg = "NONE",
  },
  CursorLine = {
    bold = true,
  },
}
