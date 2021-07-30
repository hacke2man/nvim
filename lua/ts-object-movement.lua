local textobj = require('nvim-treesitter.textobjects.move')
local configs = require('treesitter')

local M = {}

function M.moveby()
   -- textobj.move("@function.outer")
   -- local out = vim.api.nvim_exec("echo getchar()",true)
   local f = io.open("/home/liam/fifo", "w")
   -- configs.attach_module("textobjects.select.keymaps")
   f:write(configs.textobjects.select.keymaps)

   f:write("\n")
   f:close()
end

return M
