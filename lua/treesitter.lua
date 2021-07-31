
local configs = {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  textobjects = {
    --[[ move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["<space>bf"] = "@function.outer",
        ["<space>bc"] = "@call.outer",
        ["<space>bp"] = "@parameter.outer",
      },
      goto_next_end = {
        ["<space>ef"] = "@function.outer",
        ["<space>ec"] = "@call.outer",
        ["<space>ep"] = "@parameter.outer",
      },
      goto_previous_start = {
        ["<space>Bf"] = "@function.outer",
        ["<space>Bc"] = "@call.outer",
        ["<space>Bp"] = "@parameter.outer",
      },
      goto_previous_end = {
        ["<space>Ef"] = "@function.outer",
        ["<space>Ec"] = "@call.outer",
        ["<space>Ep"] = "@parameter.outer",
      },
    }, ]]
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        -- Or you can define your own textobjects like this
--[[ ["iF"] = {
python = "(function_definition) @function",
cpp = "(function_definition) @function",
c = "(function_definition) @function",
java = "(method_declaration) @function",
        }, ]]
      },
    },
  },
  indent = {
    enable = true
  }
}

return configs
