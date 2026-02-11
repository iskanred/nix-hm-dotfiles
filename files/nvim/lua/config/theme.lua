-- =========================
-- Theme
-- =========================

local function load_theme(name)
  local ok, mod = pcall(require, "themes." .. name)
  if ok and type(mod) == "table" and type(mod.load) == "function" then
    mod.load()
    return true
  end
  return false
end

local theme = vim.env.NVIM_THEME or "one-dark"
if not load_theme(theme) then
  load_theme("one-dark")
end
