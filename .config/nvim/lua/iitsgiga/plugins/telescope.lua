local treesitter_parsers = {
    'c', 'lua', 'vim', 'asm', 'bash', 'bibtex', 'cpp',
    'css', 'csv', 'dockerfile', 'dot', 'doxygen', 'fortran', 'git_rebase',
    'gitignore', 'gitcommit', 'gnuplot', 'go', 'gomod', 'gosum', 'gotmpl',
    'graphql', 'html', 'ini', 'java', 'javascript', 'json', 'json5', 'latex',
    'make', 'markdown', 'markdown_inline', 'php', 'printf', 'python', 'rasi',
    'regex', 'pip-requirements', 'rust', 'scss', 'sql', 'ssh_config', 'templ',
    'toml', 'xml', 'yaml',
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function ()
        -- treesitter setup
        require('nvim-treesitter').setup {
            ensure_installed = treesitter_parsers,
            sync_install = false,
            auto_install = true,
        }

        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        }

        -- telescope setup
        require('telescope').setup{
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {},
            extensions = {},
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end,
}
