-- =========================
-- Neovim base (vim-like)
-- =========================

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Appearence ---
vim.opt.number = true          -- row numbering
vim.opt.relativenumber = true
vim.opt.cursorline = true      -- highlight current line
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true   -- normal termincal colors

-- Long lines: no wrapping
vim.opt.wrap = false          -- do not paste row on next line
vim.opt.sidescrolloff = 5     -- keep 5 rows for horizontal scroll
-- Scroll on shift + Mouse Whell
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
vim.opt.hidden = true          -- able to switch between buffers
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- --- Clipboard ---
vim.opt.clipboard = "unnamedplus"  -- system clipboard
-- --- Behavior ---
vim.opt.mouse = "a"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

-- =========================
-- Mappings
-- =========================

-- save to file
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
-- exit
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

