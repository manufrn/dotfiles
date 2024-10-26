local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins go here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use "windwp/nvim-autopairs"
  use "goolord/alpha-nvim"

  use "nvim-treesitter/nvim-treesitter"
  use 'CRAG666/code_runner.nvim'  
  use 'akinsho/toggleterm.nvim'
  use "numToStr/Comment.nvim"
  use 'romgrk/barbar.nvim'

  use "lukas-reineke/indent-blankline.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  -- use "williamboman/nvim-lsp-installer"

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  use {'kaarmu/typst.vim', ft = {'typst'}}

  -- latex
  use { 
      'lervag/vimtex',
      -- opt = true,
      config = function ()
          -- vim.g.vimtex_view_general_viewer = 'zathura'
          vim.g.vimtex_view_method = 'zathura'
          vim.g.vimtex_syntax_enabled = 0
          vim.g.vimtex_compiler_latexmk_engines = {
              _ = '-pdflatex'
          }
          vim.g.tex_comment_nospell = 1
          vim.g.vimtex_compiler_method = 'latexmk'

          -- vim.g.vimtex_compiler_progname = 'nvr'
          -- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
          -- vim.g.vimtex_view_general_options_latexmk = '--unique'
      end
  }


  -- Colorschemes
  -- use "arcticicestudio/nord-vim"
  use "shaunsingh/nord.nvim" -- Nord Colorscheme
  use "Mofiqul/dracula.nvim"
  use  'rose-pine/neovim'
  -- use 'andersevenrud/nordic.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- telescope
  use "nvim-telescope/telescope.nvim"
  -- use "lewis6991/spellsitter.nvim"
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- Plugins get installed in following path: ~/.local/share/nvim/site/pack/packer/start
