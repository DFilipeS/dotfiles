return require('packer').startup(function()
  -- Packer 
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-commentary'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/popup.nvim'
  use 'stevearc/dressing.nvim'

  -- Themes
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Rust
  use 'simrat39/rust-tools.nvim'

  -- nvim-autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- toggleterm.nvim
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("bufferline").setup{}
    end
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        show_hidden = true
      }
    end
  }
end)

