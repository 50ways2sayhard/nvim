local map = vim.api.nvim_set_keymap
local setting = {noremap = true}

-- navigating
map('i', "<C-a>", "<Home>", {noremap = true})
map('i', "<C-e>", "<End>", {noremap = true})
map('i', "<C-f>", "<Right>", {noremap = true})
map('i', "<C-b>", "<Left>", {noremap = true})
map('i', "<C-p>", "<Up>", {noremap = true})
map('i', "<C-n>", "<Down>", {noremap = true})

map('n', '/', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", setting)
map('n', '<leader><space>', "<cmd>lua require('telescope.builtin').commands()<cr>", setting)

-- hop
-- map('n', '<leader>jj', "<cmd>lua require'hop'.hint_char1()<cr>", setting)

-- files
-- map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", setting)
-- map('n', '<leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", setting)

-- buffers
-- map('n', '<leader>bb', "<cmd>lua require('telescope.builtin').buffers()<cr>", setting)

-- search
-- map('n', '<leader>sp', "<cmd>lua require('telescope.builtin').live_grep()<cr>", setting)
-- map('n', '<leader>si', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", setting)
-- map('n', '<leader>sI', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", setting)

-- project
map('n', '<leader>pp', ":lua require'telescope'.extensions.project.project{}<CR>", setting)


-- lsp & code
-- map('n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", setting)
-- map('n', '<leader>cr', "<cmd>lua vim.lsp.buf.rename()<CR>", setting)
-- map('n', '<leader>cd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", setting)
-- map('n', '<leader>cD', "<cmd>lua require('telescope.builtin').lsp_implements()<cr>", setting)
map('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", setting)
map('n', 'gD', "<cmd>lua require('telescope.builtin').lsp_implements()<cr>", setting)

-- errors
-- map('n', '<leader>el', "<cmd>Trouble<cr>", setting)
