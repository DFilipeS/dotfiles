local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
  local keymap_opts = { buffer = buffer }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, keymap_opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, keymap_opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
end

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "elixir-ls" }
})

mason_lspconfig.setup_handlers({
  function(server_name)
    if server_name == "rust_analyzer" then
      -- Configure LSP through rust-tools.nvim plugin.
      -- rust-tools will configure and enable certain LSP features for us.
      -- See https://github.com/simrat39/rust-tools.nvim#configuration
      local opts = {
        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
          -- on_attach is a callback called when the language server attachs to the buffer
          on_attach = on_attach,
          settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }

      require("rust-tools").setup(opts)
    elseif server_name == "tailwindcss" then
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        init_options = {
          userLanguages = {
            elixir = "phoenix-heex",
            heex = "phoenix-heex",
          },
        }
      })
    else
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
      }
    end
  end
})


-- nvim-cmp

vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require 'cmp'

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
