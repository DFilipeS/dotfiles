local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "tailwindcss-language-server",
        "emmet-ls",
        "elixir-ls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "rust",
        "toml",
        "elixir",
        "heex",
        "eex",
        "markdown",
        "sql",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = function ()
  --     return require "custom.configs.rust-tools"
  --   end,
  --   config = function (_, opts)
  --     require("rust-tools").setup(opts)
  --   end
  -- },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  },
}
return plugins
