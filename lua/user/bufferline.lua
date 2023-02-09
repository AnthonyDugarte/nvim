local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

bufferline.setup {
  options = {
    offsets = {
      {

      filetype = "NvimTree",
      text = "File Explorer",
      highligh = "Directory",
      sparator = true,
      padding = 1,
    }
    }
  }
}
