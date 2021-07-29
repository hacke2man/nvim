
--[[ local gitadd = function(_window, buffer)
  local adds = get_git_changes(2) .. "  "
  return adds
end ]]

--[[ local gitdelete = function(_window, buffer)
  local del = get_git_changes(3) .. "  "
  return del
end ]]

--[[ local gitfiles = function(_window, buffer)
  local fil = get_git_changes(1) .. "  "
  return fil
end ]]

function isntnil(item)
  if(item ~= nil) then
    return item
  else
    return 0
  end
end

local gittotal = function(_window, buffer)
  local total = isntnil(tonumber(get_git_changes(2)))
  local total = total + isntnil(tonumber(get_git_changes(3)))
  
  if total > 0 then
    return  "  " .. total
  else
    return ''
  end
end

local extensions = require('el.extensions')
local log = require('el.log')
local meta = require('el.meta')
local processor = require('el.processor')
local sections = require('el.sections')
local subscribe = require('el.subscribe')

local handle = io.popen("echo -n hi")
local result = handle:read("*a")

local lsperror = function (_window, buffer)
  local warnum = vim.lsp.diagnostic.get_count(0, [[Error]])
  if warnum == 0 then 
    return ''
  else
    return "  " .. warnum
  end
end

local lspwarn = function (_window, buffer)
  local warnum = vim.lsp.diagnostic.get_count(0, [[Warning]])
  if warnum == 0 then 
    return ''
  else
    return "  " .. warnum
  end
end

require('el').setup {
  -- An example generator can be seen in `Setup`.
  -- A default one is supplied if you do not want to customize it.
  generator = function()
    return {
      " ",
      sections.highlight( "Statement" , subscribe.buf_autocmd(
        "el_git_branch",
        "BufEnter",
        function(window, buffer)
          local branch = extensions.git_branch(window, buffer)
          if branch then
            return branch
          end
        end
      )),
      " ",
      "%t",
      " ",
      subscribe.buf_autocmd(
        "el_file_icon",
        "BufRead",
        function(_, buffer)
          return extensions.file_icon(_, buffer)
        end
      ),

      sections.highlight( "LspDiagnosticsDefaultError" , subscribe.buf_autocmd(
        "el_lsp_error",
        "CursorHold",
        lsperror
      )),

      sections.highlight( "LspDiagnosticsDefaultWarning" , subscribe.buf_autocmd(
        "el_lsp_warn",
        "CursorHold",
        lspwarn
      )),

      sections.split,

      --[[ sections.highlight( "GitSignsChange" , subscribe.buf_autocmd(
        "el_git_files",
        "BufWritePost",
        gitfiles
      )),

       sections.highlight( "GitSignsAdd" , subscribe.buf_autocmd(
        "el_git_add",
        "BufWritePost",
        gitadd
      )),

       sections.highlight( "GitSignsDelete" , subscribe.buf_autocmd(
        "el_git_del",
        "BufWritePost",
        gitdelete
      )), ]]
       sections.highlight( "GitSignsChange" , subscribe.buf_autocmd(
        "el_git_tot",
        "BufWritePost",
        gittotal
      )),


      " ",
      '%l',
      " ",
    }
  end,
}

function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function get_git_changes ( num )
  local handle = io.popen("git diff --shortstat 2>/dev/null")
  local result = handle:read("*a")

  if (result == nil or result == '') then
    return ''
  else
    local tab= mysplit(result, ',')
    if (tab[num] == nil or tab[num] == '') then
      return ''
      else
      local out = tab[num]:match("([^% ]+)")
      return out
    end
  end

end
