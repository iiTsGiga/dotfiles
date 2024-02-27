local language_servers = {
    "lua_ls", "bashls", "dotls", "dockerls", "texlab", --"autotools-language-server",
    "cssls", "html", "htmx", "jsonls", "marksman", "templ", "lemminx", "yamlls",
    "cypher_ls", "graphql", "sqlls",
    "tsserver", "intelephense",
    "rust_analyzer", "gopls", "jdtls", "jedi_language_server",
    "asm_lsp", "clangd", "fortls", "arduino_language_server", -- "r_language_server",
}

local server_settings = {
    ["lua_ls"] = {
        globals = { "vim" }
    },

    ["fortls"] = {
        cmd = {"fortls", "--lowercase_intrinsics", "--hover_signature", "--hover_language=fortran",
                         "--use_signature_help", "--max_line_length=132", "--max_comment_line_length=132"},
    },

    ["clangd"] = {
        cmd = {"clangd", "--clang-tidy", "--function-arg-placeholders=0"},
    },

    ["sqlls"] = {
        cmd = {"sql-language-server", "up", "--method", "stdio"},
        filetypes = {"sql", "mysql"},
        root_dir = function() return vim.loop.cwd() end,
    },
}

return { -- https://www.youtube.com/watch?v=MuUrCcvE-Yw
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- setup fidget.nvim
        require('fidget').setup {}

        -- setup nvim-cmp
        local cmp = require('cmp')
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        }

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- setup language servers
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = language_servers,
            handlers = {
                function (server_name) --default handler
                    local settings = vim.tbl_deep_extend(
                        "force",
                        {},
                        server_settings[server_name] or {},
                        {
                            on_attach = on_attach,
                            capabilities = capabilities,
                        }
                    )
                    require("lspconfig")[server_name].setup(settings)
                end,
            },
        }

        -- setup diagnostic
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
