-- =========================
-- Neovim base (vim-like)
-- =========================

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Appearance ---
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Long lines: no wrapping
vim.opt.wrap = false
vim.opt.sidescrolloff = 5

-- Scroll on shift + Mouse Wheel
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:3,hor:6"
vim.keymap.set({ "n", "v" }, "<S-ScrollWheelUp>", "3zh", { silent = true })
vim.keymap.set({ "n", "v" }, "<S-ScrollWheelDown>", "3zl", { silent = true })

-- --- Shifts ---
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- --- Search ---
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- --- Buffers & Undo ---
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- --- Clipboard ---
vim.opt.clipboard = "unnamedplus"

-- --- Behavior ---
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
