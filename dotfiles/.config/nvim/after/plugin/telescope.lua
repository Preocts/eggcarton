local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    }
})

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})

