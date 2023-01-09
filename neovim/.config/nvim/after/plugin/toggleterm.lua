require("toggleterm").setup {
    float_opts = {
        border = 'curved'
    }
}

vim.keymap.set('n', '<C-\\>', function () vim.cmd("ToggleTerm direction=float") end)
vim.keymap.set('t', '<C-\\>', function () vim.cmd("ToggleTerm direction=float") end)

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = 'lazygit',
    direction = 'float',
    hidden = true,
    float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
    },
    on_open = function(_)
        vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
})

function ToggleLazygit()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>gg', ToggleLazygit)
