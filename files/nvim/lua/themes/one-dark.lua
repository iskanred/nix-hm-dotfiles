local M = {}

function M.load()
  local ok, onedark = pcall(require, "onedark")
  if not ok then
    return
  end

  onedark.setup({
    style = "dark",
  })
  onedark.load()
end

return M
