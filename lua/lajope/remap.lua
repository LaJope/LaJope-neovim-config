vim.g.mapleader = ' '
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- new
-- go to beggining/end
vim.keymap.set('i', '<C-b>', '<ESC>^i')
vim.keymap.set('i', '<C-e>', '<End>')

-- navigate within insert mode
-- vim.keymap.set('i', '<C-h>', '<nop>')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')

-- swith between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- save
vim.keymap.set('n', '<C-s>', vim.cmd.w)


-- GENERAL
-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to the current
vim.keymap.set("n", "J", "mzJ`z")

-- move up and own by half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move to the next searched word
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to the global buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- unbind Alt-s
vim.keymap.set('n', '<A-s>', '<nop>')
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- rename every enstance of the word in the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- cmd commands
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "Packer.lua",
    callback = function()
        vim.api.nvim_set_keymap("n", "<leader>pc", ":so<CR>:PackerSync<CR>", { buffer = true })
    end,
})
-- vim.keymap.set('n', '<leader>pc', function()
--    vim.cmd('so')
--    vim.cmd('PackerSync')
-- end)


vim.keymap.set('n', '<leader>wh', vim.cmd.sp) -- split horizontally
vim.keymap.set('n', '<leader>wv', vim.cmd.vs) -- split vertically

-- fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)



-- harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-i>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-m>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
-- vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)



-- nvim-tree
-- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
-- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFocus)



-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)



-- comment
vim.keymap.set('n', '<leader>/', function() require("Comment.api").toggle.linewise.current() end)
vim.keymap.set('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')



-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})



-- dap
vim.keymap.set('n', '<leader>db', vim.cmd.DapToggleBreakpoint)
vim.keymap.set('n', '<leader>dr', vim.cmd.DapContinue)



-- Comment (default mappings)
--
-- NORMAL MODE
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
--
-- VISUAL MODE
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment
--
--
-- # Linewise
--
-- `gcw` - Toggle from the current cursor position to the next word
-- `gc$` - Toggle from the current cursor position to the end of line
-- `gc}` - Toggle until the next blank line
-- `gc5j` - Toggle 5 lines after the current cursor position
-- `gc8k` - Toggle 8 lines before the current cursor position
-- `gcip` - Toggle inside of paragraph
-- `gca}` - Toggle around curly brackets
--
-- # Blockwise
--
-- `gb2}` - Toggle until the 2 next blank line
-- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
-- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)



-- lsp
--  ("n", "gd", vim.lsp.buf.definition())
--  ("n", "K", vim.lsp.buf.hover())
--  ("n", "<leader>vws", vim.lsp.buf.workspace_symbol())
--  ("n", "<leader>vd", vim.diagnostic.open_float())
--  ("n", "[d", vim.diagnostic.goto_next())
--  ("n", "]d", vim.diagnostic.goto_prev())
--  ("n", "<leader>vca", vim.lsp.buf.code_action())
--  ("n", "<leader>vrr", vim.lsp.buf.references())
--  ("n", "<leader>vrn", vim.lsp.buf.rename())
--  ("i", "<C-u>", vim.lsp.buf.signature_help())
--
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-o>'] = cmp.mapping.confirm({ select = true });
--  ['<C-Space>'] = cmp.mapping.complete(),



-- barbar
--
-- -- Move to previous/next
-- vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
-- vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
--
-- -- Re-order to previous/next
-- vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
-- vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
--
-- -- Goto buffer in position...
-- vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
--
-- -- Pin/unpin buffer
-- vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
--
-- -- Close buffer
-- vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
--
-- -- Magic buffer-picking mode
-- vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
