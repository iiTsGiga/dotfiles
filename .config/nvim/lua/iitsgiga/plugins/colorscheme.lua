return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            terminal_colors = true,
            styles = {
                comment = { italic = true },
                keyword = { italic = true },
                type = { italic = true },
                comment = { italic = true },
                keyword = { italic = true },
                type = { italic = true },
                storageclass = { italic = true },
                structure = { italic = true },
                parameter = { italic = true },
                annotation = { italic = true },
                tag_attribute = { italic = true },
            },
            filter = "pro",
            inc_search = "background",
        })

        vim.cmd("colorscheme monokai-pro")
    end
}
