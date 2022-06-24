local options = {
  backup=false,
  clipboard="unnamedplus",
  cmdheight=1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = true,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = false,
  splitright = true,
  swapfile = false,

  timeoutlen = 1000,
  undofile = true,
  updatetime = 50,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  colorcolumn = "80",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set autoread"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set guicursor="
