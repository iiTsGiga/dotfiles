require("iitsgiga.core")
require("iitsgiga.lazy")

local filetype = vim.bo.filetype
if filetype == "make" then
    vim.opt.expandtab = false
elseif filetype == "sh" then
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
end

