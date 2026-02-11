-- =========================
-- Mappings
-- =========================

-- save to file
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
-- exit
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

-- LSP helpers
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- Toggle diagnostics
vim.keymap.set("n", "<leader>td", function()
  local enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not enabled)
end, { desc = "Toggle diagnostics" })
