-- See pylsp or any given lsp details in new buffer
-- enew|put=execute(\"lua print(vim.inspect(vim.lsp.get_active_clients({name='pylsp'})))\")
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

local servers = {
    pylsp = {
        pylsp = {
            plugins = {
                flake8 = {enabled = true},
                autopep8 = {enabled = false},
                pycodestyle = {enabled = false},
                pyflakes = {enabled = false},
                pylint = {enabled = false},
                yapf = {enabled = false},
                jedi_completion = {fuzzy = true},
                jedi_definition = {follow_builtin_imports = true},
                jedi_hover = {follow_builtin_imports = true},
                jedi_references = {follow_builtin_imports = true},
                jedi_rename = {follow_builtin_imports = true},
                jedi_signature_help = {follow_builtin_imports = true},
                jedi_symbols = {follow_builtin_imports = true},
            },
        },
    },
}

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            settings = servers[server_name],
        }
    end,
}
