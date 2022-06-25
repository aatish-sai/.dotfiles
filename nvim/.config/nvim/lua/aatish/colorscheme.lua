vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

vim.g.tokyonight_colors = {
  hint = "orange",
  error = "#ff0000"
}

vim.cmd [[
colorscheme tokyonight
]]


local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

icons.setup{
  default = true;
}
