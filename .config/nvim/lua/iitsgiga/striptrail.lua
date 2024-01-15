vim.api.nvim_exec2([[
fun! TrimTrailingWhitespace()
    if &ft =~ 'diff'
        return
    endif
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]], {})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = { "*" },
--     command = "call TrimTrailingWhitespace()",
-- })
