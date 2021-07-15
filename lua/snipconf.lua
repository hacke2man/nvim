require'snippets'.use_suggested_mappings()

 --  There are only two keybindings specified by the suggested keymappings, which is <C-k> and <C-j>
 --  They are exactly equivalent to:

 --  <c-k> will either expand the current snippet at the word or try to jump to
 --  the next position for the snippet.
vim.api.nvim_set_keymap("i", "<c-j>", "lua return require'snippets'.advance_snippet(-1)", {expr = true})
 --  <c-j> will jump backwards to the previous field.
 --  If you jump before the first field, it will cancel the snippet.
vim.api.nvim_set_keymap("i", "<c-k>", "lua return require'snippets'.advance_snippet(1)", {expr = true})

-- And now for some examples of snippets I actually use.
local snippets = require'snippets'
local U = require'snippets.utils'
snippets.snippets = {
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']];
    func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]];
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    -- Match the indentation of the current line for newlines.
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  _global = {
    -- If you aren't inside of a comment, make the line a comment.
    copyright = U.force_comment [[Copyright (C) Ashkan Kiani ${=os.date("%Y")}]];
  };

  cpp = {
    ["header"] = [[
#ifndef __$1_H__
#define __$1_H__

#ifdef __cplusplus
extern "C" {
#endif

  $0

#ifdef __cplusplus
}
#endif

#endif]];
  };
}
