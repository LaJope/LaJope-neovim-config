-- vim.api.nvim_create_autocmd('ColorScheme', {
--     callback = vim.schedule_wrap(function()
    --     hi config
--     end),
--     group = vim.api.nvim_create_augroup('foo', {}),
-- })

vim.cmd('set background=dark')
vim.cmd('colorscheme gruvbox-material')

-- Works faster without autocmd ???
-- General background and split background
vim.cmd('hi normal guibg=NONE')
vim.cmd('hi normalNC guibg=NONE')
-- NvimTree background
vim.cmd('hi NvimTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE')
-- BarBar background
vim.cmd('hi BufferTabpageFill guibg=NONE ctermbg=NONE')
-- vim.cmd('hi BufferCurrent')
-- vim.cmd('hi BufferCurrentCHANGED guibg=NONE')
vim.cmd('hi BufferInactive guibg=NONE')
