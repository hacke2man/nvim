local textobj = require('nvim-treesitter.textobjects.move')
local configs = require('treesitter')

local M = {}

function M.moveby(direction)
   -- textobj.move("@function.outer")
   local out = string.char(vim.api.nvim_exec("echo getchar()",true))
   out = out .. string.char(vim.api.nvim_exec("echo getchar()",true))
   local f = io.open("/home/liam/fifo", "w")
   for k, v in pairs(configs.textobjects.select.keymaps) do
      if out == tostring(k) then
         if direction == "start" then
         textobj.goto_next_end(tostring(v))
         else if direction == "end" then
         end
         break
--[[ M.goto_next_start = function(query_string)
  move(query_string, "forward", "start")
end
M.goto_next_end = function(query_string)
  move(query_string, "forward", not "start")
end
M.goto_previous_start = function(query_string)
  move(query_string, not "forward", "start")
end
M.goto_previous_end = function(query_string)
  move(query_string, not "forward", not "start")
end ]]
      end
   end

   f:write("\n")
   f:close()
end

return M
