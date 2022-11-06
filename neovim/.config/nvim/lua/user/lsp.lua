local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{}
  end
})

-- require('lspconfig').gopls.setup{
--     capabilities = capabilities,
--     on_attach = function()
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
--         vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
--         vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
--         vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
--         vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
--         vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
--         vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {buffer = 0})
--         vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
--     end,
-- }

-- require('lspconfig').elixirls.setup {
--     cmd = { "/Users/daniel/Developer/Elixir/elixir-ls/release/language_server.sh" };
--     capabilities = capabilities,
--     on_attach = function()
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
--         vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
--         vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
--         vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
--         vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
--         vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
--         vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {buffer = 0})
--         vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
--     end,
-- }

-- nvim-cmp

vim.opt.completeopt={"menu", "menuone", "noselect"}
local cmp = require'cmp'

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
