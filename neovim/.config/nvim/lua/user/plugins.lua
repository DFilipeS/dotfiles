return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary' 
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Themes
  use 'gruvbox-community/gruvbox'
  use 'kyazdani42/nvim-web-devicons'
  
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {
    "windwp/nvim-autopairs", 
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)

