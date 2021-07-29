local parsers = require'nvim-treesitter.parsers'
local query   = require("nvim-treesitter.query")
local M = {}

M.check = function ()
  local p = parsers.get_parser(0, "lua")
  local f = io.open("/home/liam/fifo", "w")
  local root = p:parse()[1]:root()
  local query = vim.treesitter.get_query("lua", "pull")
  local array = {}
  local numa = {}

  f:write("\n\n")
  local i = 1
  for id,value in query:iter_captures(root, 0, 0, -1) do
    local string = vim.treesitter.get_node_text(value, 0)

    if string ~= nil then
      array[i] = string
      numa[i] = value:range()
    end
    i = i + 1
  end

  for j,v in pairs(array) do
    if(v:match("%(.*%)")) then
      f:write(numa[j] + 1 .. ",") 
    end
    j = j + 1
  end
  f:close()
end

return M
