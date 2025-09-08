-- Options configuration
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = ""

-- Mode display
vim.opt.showmode = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Sign column
vim.opt.signcolumn = "yes"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live substitution preview
vim.opt.inccommand = "split"

-- Cursor line
vim.opt.cursorline = true

-- General settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.tw = 100
vim.opt.colorcolumn = "+1"
vim.opt.termguicolors = true
vim.opt.pumheight = 5
