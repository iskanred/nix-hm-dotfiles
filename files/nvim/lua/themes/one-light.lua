local M = {}

function M.load()
  local ok, onedark = pcall(require, "onedark")
  if not ok then
    return
  end

  onedark.setup({
    style = "light",
  })
  onedark.load()
end

return M
