-- =========================
-- Java (jdtls)
-- =========================

local M = {}

local root_markers = {
  "gradlew",
  "mvnw",
  "pom.xml",
  "build.gradle",
  "settings.gradle",
  ".git",
}

local function get_root(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    return vim.fn.getcwd()
  end

  local dir = vim.fs.dirname(name)
  return vim.fs.root(dir, root_markers) or vim.fn.getcwd()
end

function M.setup(base)
  local cmd = { "jdtls" }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function(ev)
      vim.lsp.start({
        name = "jdtls",
        cmd = cmd,
        root_dir = get_root(ev.buf),
        capabilities = base.capabilities,
        on_attach = base.on_attach,
      })
    end,
  })
end

return M
