local tabsizes = {
    { lang = "sh"     , spaces = 2 },
    { lang = "fortran", spaces = 3 },
    { lang = "make"   , keeptabs = true },
}

for _, opt in ipairs(tabsizes) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = opt.lang,
        callback = function()
            if (opt.spaces ~= nil) then
                vim.opt.tabstop = opt.spaces
                vim.opt.shiftwidth = opt.spaces
                vim.opt.softtabstop = opt.spaces
            end

            if (opt.keeptabs ~= nil) then
                vim.opt.expandtab = not opt.keeptabs
            end
        end
    })
end

