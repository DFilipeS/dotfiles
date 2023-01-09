local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'sumneko_lua',
	'rust_analyzer',
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function (client, bufnr)
   local opts = {buffer = bufnr, remap = false}

   vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
   vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
end)

lsp.configure('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy'
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
