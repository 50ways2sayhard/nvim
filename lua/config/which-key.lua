require("which-key").setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 9, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 1, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 1, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    n = { "o", "O" },
  },
})

local wk = require('which-key')

wk.register({
  ['<leader>'] = {
    b = {
      name = "+buffer",
      b = { "<cmd>Telescope buffers<cr>", "Buffers"},
      d = {"<cmd>bd<cr>", "Close buffer"},
    },
    c = {
      a = {"<cmd>Telescope lsp_code_actions<cr>", "Code actions"},
      r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol"},
      d = {"<cmd>Telescope lsp_definitions<cr>", "Go to definition"},
      D = {"<cmd>Telescope lsp_implements<cr>", "Go to implementation"},
    },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    j = {
      name = "+jump",
      j = { "<cmd>HopChar1<cr>", "Jump to char"},
      l = { "<cmd>HopLine<cr>", "Jump to line"},
    },
    e = {
      name = "+error",
      l = { "<cmd>Trouble<cr>", "Show errors" }
    },
    s = {
      name = "+search",
      p = { "<cmd>Telescope live_grep<cr>", "Search in project"},
      i = {"<cmd>Telescope lsp_document_symbols<cr>", "Imenu"},
      I = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Imenu workspace"}
    }
  }
})
