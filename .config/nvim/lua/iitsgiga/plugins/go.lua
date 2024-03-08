return {
    'fatih/vim-go',
    config = function()
        vim.g.go_fmt_command = "goimports"
        -- vim.g.go_fmt_autosave = false
        vim.opt.listchars:append({ tab = "  " })
    end
}
