local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notiy("colorscheme " .. colorscheme .. " not found!")
  return
end

