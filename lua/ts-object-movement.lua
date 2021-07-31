local textobj = require('nvim-treesitter.textobjects.move')
local configs = require('treesitter')

local M = {}

function M.moveby(direction)
   local out = string.char(vim.api.nvim_exec("echo getchar()",true))
   out = out .. string.char(vim.api.nvim_exec("echo getchar()",true))
   local count = vim.api.nvim_exec("echo v:count1", true)

   for k, v in pairs(configs.textobjects.select.keymaps) do
    if out == tostring(k) then
      if direction == "next_start" then
        Call(count, textobj.goto_next_start, tostring(v))
      end

      if direction == "next_end" then
        Call(count, textobj.goto_next_end, tostring(v))
      end

      if direction == "previous_end" then
        Call(count, textobj.goto_previous_start, tostring(v))
      end

      if direction == "previous_end" then
        Call(count, textobj.goto_previous_start, tostring(v))
      end
      break
    end
  end
end

function Call(count, func, obj)
  for i = 1,count do
    func(obj)
  end
end

return M
