vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Scheme
  use 'cocopon/iceberg.vim'
  use 'kaicataldo/material.vim'
  use 'sainnhe/gruvbox-material'

  -- Statusbar config
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- Syntax highlight
  use 'sheerun/vim-polyglot'

  -- Telescope
  use{ 'nvim-lua/plenary.nvim'}
  use{ 'nvim-telescope/telescope.nvim'}
  use{
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }

  -- LSP
  use {'neoclide/coc.nvim', branch = 'release'}

  -- File Explorer
  use {'lambdalisue/fern.vim'}
  use {'lambdalisue/fern-git-status.vim'}

  -- git
  use {'airblade/vim-gitgutter'}

  -- highlighting
  use 'nvim-treesitter/nvim-treesitter'

  -- Indent guide
  use 'lukas-reineke/indent-blankline.nvim'

  -- Auto close parentheses
  use 'cohama/lexima.vim'
end)

