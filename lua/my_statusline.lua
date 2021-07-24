-- https://github.com/bartoszmaka/dotfiles/blob/master/vim/lua/plugins/galaxyline.lua

local vim = vim
local galaxyline = require('galaxyline')

local section = galaxyline.section

local gruvbox = {
        black = '#1d2021',
          bg0 = '#282828',
          bg1 = '#3c3836',
          bg2 = '#504945',
          bg3 = '#665c54',
    bg_yellow = '#f2cc81',
           fg = '#ebdbb2',
       purple = '#b16286',
        green = '#98971a',
       orange = '#d65d0e',
         blue = '#458588',
       yellow = '#d79921',
         cyan = '#689d6a',
          red = '#cc241d',
}

local colors = {
  bg = gruvbox.bg0,
  bg_inactive = gruvbox.bg3,
  fg = gruvbox.fg,
  fg_focus = '#f8f8f2',
  section_bg = gruvbox.bg0,
  yellow = gruvbox.yellow,
  cyan = gruvbox.cyan,
  green = gruvbox.green,
  orange = gruvbox.orange,
  magenta = gruvbox.purple,
  blue = gruvbox.blue,
  red = gruvbox.red,
  black = gruvbox.black,
}

local buffer_not_empty = function()
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local mode_color = function()
  local mode_colors = {
    n = colors.green,
    i = colors.blue,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

section.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode gui=bold guifg='..mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return '  '..alias_mode..' '
    end,
    separator = ' ',
    highlight = { colors.bg, colors.section_bg },
    separator_highlight = {colors.bg, colors.section_bg },
  },
}

section.left[2] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

section.left[3] = {
  FileName = {
    provider = function ()
      return vim.fn.expand('%p')
    end,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator_highlight = {colors.fg, colors.section_bg },
  }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

section.left[4] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.green, colors.statusline_bg}
    }
}

section.left[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.blue, colors.statusline_bg}
    }
}

section.left[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

section.left[7] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

section.left[8] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

section.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                return " " .. "  "
            else
                return ""
            end
        end,
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

section.right[2] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  Top "
            elseif current_line == vim.fn.line("$") then
                return "  Bot "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "  " .. result .. "% "
        end,
        highlight = {colors.green, colors.lightbg}
    }
}

-- section.right[3] = {
--     GitBranch = {
--         provider = "GitBranch",
--         condition = require("galaxyline.provider_vcs").check_git_workspace,
--         highlight = {colors.grey_fg2, colors.lightbg}
--     }
-- }

section.short_line_left[1] = {
  SpacerInactive = {
    provider = function()
      return '  '
    end,
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = {colors.fg, colors.bg_inactive },
  }
}

section.short_line_left[2] = {
  FileIconInactive = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    separator = ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color,  colors.bg_inactive },
  }
}

section.short_line_left[3] = {
  FileNameInactive = {
    provider = function ()
      return vim.fn.expand('%f')
    end,
    separator = ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { colors.fg, colors.bg_inactive },
  }
}

section.short_line_right[1] = {
  LineColumnInactive = {
    provider = 'LineColumn',
    separator = ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { colors.fg, colors.bg_inactive },
  }
}

galaxyline.load_galaxyline()
