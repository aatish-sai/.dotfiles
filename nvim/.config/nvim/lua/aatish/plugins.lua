local fn = vim.fn

-- Automatically insatll packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]

end

-- Autocommand that reloads nowvim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a pretected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function ()
      return require("packer.util").float {border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function (use)
  -- Plugins Here
  use "wbthomason/packer.nvim"

  -- Nvim Tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  --Buffer Line
  use "famiu/bufdelete.nvim"
  use "akinsho/bufferline.nvim"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }

  --Colorschemes
  use "gruvbox-community/gruvbox"
  use "folke/tokyonight.nvim"

  -- Completion plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  -- Tabnine
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh"
  }

  -- snippets
  use "L3MON4D3/LuaSnip"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "nvim-lua/lsp_extensions.nvim"
  use "onsails/lspkind-nvim"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"
  use "glepnir/lspsaga.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Comment String
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "numToStr/Comment.nvim"

  -- Auto Pairs
  use "windwp/nvim-autopairs"
  --
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
