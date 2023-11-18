require("basic_vim_init")

local filetype = vim.bo.filetype
if filetype == "make" then
    basic_vim_init(nil, true)
elseif filetype == "sh" then
    basic_vim_init(2, nil)
else
    basic_vim_init()
end

