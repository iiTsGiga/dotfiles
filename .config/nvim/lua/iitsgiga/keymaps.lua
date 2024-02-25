vim.g.mapleader = " "

-- convenience
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center cursor when scrolling down half page
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center cursor when scrolling up half page
vim.keymap.set("x", "p", "\"_dP") -- don't copy on paste
vim.keymap.set("v", "Y", "\"+y") -- yank into system clipboard

-- move selection up/down
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
-- vim.keymap.set("i", "<C-k>", "<ESC>:m .-2<CR>==gi")
-- vim.keymap.set("i", "<C-j>", "<ESC>:m .+1<CR>==gi")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- lsp
function Ctrl_L()
    vim.cmd("nohlsearch")
    vim.cmd("diffupdate")
    vim.cmd("LspRestart")
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vh", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        -- vim.keymap.set("i", "<C-n>", function() vim.lsp.buf.completion() end, opts)
        vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>dN", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("v", "<C-l>", function() Ctrl_L() end, opts)
        vim.keymap.set("n", "<C-l>", function() Ctrl_L() end, opts)
    end,
})
