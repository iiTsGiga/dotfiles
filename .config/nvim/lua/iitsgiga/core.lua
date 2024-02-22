-- # basic vim setup
vim.opt.updatetime = 100

-- ## indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

-- ## searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.showmatch = true

-- ## displaying
vim.opt.syntax = "on"
vim.opt.ruler = true
vim.opt.colorcolumn = "120"
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.shortmess = "t"
vim.opt.list = true
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.listchars = { trail = "·", tab = ">·", extends = "⏵" }
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
vim.opt.hidden = false
