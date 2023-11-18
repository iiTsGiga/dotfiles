function basic_vim_init(indent_size, keep_tabs)
    if indent_size == nil then indent_size = 4 end
    if keep_tabs == nil then keep_tabs = false end

    -- # basic vim setup
    vim.opt.syntax = "on"

    -- ## indenting
    vim.opt.tabstop = indent_size
    vim.opt.shiftwidth = indent_size
    vim.opt.softtabstop = indent_size

    vim.opt.autoindent = true
    if keep_tabs then
        vim.opt.expandtab = false
        vim.opt.smarttab = false
    else
        vim.opt.expandtab = true
        vim.opt.smarttab = true
    end

    -- ## searching
    vim.opt.incsearch = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.hlsearch = false
    vim.opt.showmatch = true

    -- ## displaying
    vim.opt.ruler = true
    vim.opt.laststatus = 2
    vim.opt.showcmd = true
    vim.opt.showmode = true
    vim.opt.list = true
    vim.opt.wrap = false
    vim.opt.textwidth = 0
    vim.opt.listchars = { trail = "·", tab = ">·", extends = "⏵" }
    vim.opt.shortmess = ""
    vim.opt.encoding = "utf-8"
    vim.opt.fileformat = "unix"
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.title = true

    -- ## command completion
    vim.opt.wildmode = { "longest", "list", "full" }
    vim.opt.wildmenu = true

    -- ## mouse navigation
    vim.opt.mouse = "a"

    -- ## other stuff
    vim.opt.hidden = true
end
