-- =========================
-- LSP
-- =========================

local M = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

local function load_language_servers()
  local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
  local files = vim.fn.globpath(lsp_dir, "*.lua", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    local ok, server = pcall(require, "lsp." .. name)
    if ok and type(server.setup) == "function" then
      server.setup(M)
    end
  end
end

load_language_servers()

return M
