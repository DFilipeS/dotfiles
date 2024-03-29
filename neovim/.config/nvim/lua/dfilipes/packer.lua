local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'navarasu/onedark.nvim'
  use 'lunarvim/lunar.nvim'
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
  })

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use 'mbbill/undotree'

  use {
	  "windwp/nvim-autopairs",
	  config = function() require("nvim-autopairs").setup {} end
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

		  -- Useful status updates for LSP
		  {'j-hui/fidget.nvim'},

		  -- Additional lua configuration, makes nvim stuff amazing
		  {'folke/neodev.nvim'},
	  },
	  config = function ()
		  require('fidget').setup()
		  require('neodev').setup()
	  end
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function () require('lualine').setup {} end
  }

  use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      config = function() require("toggleterm").setup() end
  }

  use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end
  }
end)
