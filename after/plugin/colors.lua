vim.cmd('set background=dark')
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = vim.schedule_wrap(function()
    -- callback = function()
        vim.cmd('hi normal guibg=NONE')
        vim.cmd('hi normalNC guibg=NONE')

        vim.cmd('hi NvimTreeNormal guibg=NONE ctermbg=NONE')
        vim.cmd('hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE')

        vim.cmd('hi BufferTabpageFill guibg=NONE ctermbg=NONE')
        vim.cmd('hi BufferCurrent guibg=NONE')
        vim.cmd('hi BufferCurrentCHANGED guibg=NONE')
    -- end,
    end),
    group = vim.api.nvim_create_augroup('foo', {}),
})
vim.cmd('colorscheme gruvbox-material')

