local textobj = require('nvim-treesitter.textobjects.move')
local configs = require('treesitter')

local M = {}

function M.moveby(direction)
  local chr = ""
  local str = ""
  local count = 1
  while true do
    chr = vim.api.nvim_exec("echo getchar()",true)
    if tonumber(chr) == 27 then
      break
    end

    str = str .. string.char(chr)
    count = tonumber(str:match("%d*"))
    if count == nil or count == 0 then
      count = 1
    end

    if Matches(str:match("%a+"), direction, count) == "done" then
      break
    end
  end
end

function Matches(out, direction, count)
    for k, v in pairs(configs.textobjects.select.keymaps) do
      if out == tostring(k) then
        if direction == "next_start" then
          Call(count, textobj.goto_next_start, tostring(v))
        end

        if direction == "next_end" then
          Call(count, textobj.goto_next_end, tostring(v))
        end

        if direction == "previous_start" then
          Call(count, textobj.goto_previous_start, tostring(v))
        end

        if direction == "previous_end" then
          Call(count, textobj.goto_previous_end, tostring(v))
        end
        return "done"
      end
    end
    return "nd"
end

function Call(count, func, obj)
  for i = 1,count do
    func(obj)
  end
end

return M
