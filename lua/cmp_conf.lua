local cmp = require'cmp'
local compare = require('cmp.config.compare')
local types = require('cmp.types')

local WIDE_HEIGHT = 40
cmp.setup({
completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
      completeopt = 'menu,menuone,noselect',
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
      get_trigger_characters = function(trigger_characters)
        return trigger_characters
      end
    },

    snippet = {
      expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    preselect = types.cmp.PreselectMode.Item,

    documentation = {
      border = { '', '', '', ' ', '', '', '', ' ' },
      winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    },

    confirmation = {
      default_behavior = types.cmp.ConfirmBehavior.Insert,
    },

    sorting = {
      priority_weight = 2,
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      }
    },

    event = {},

    mapping = {
        -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },

    formatting = {
      deprecated = true,
      format = function(_, vim_item)
        return vim_item
      end
    },

    sources = {
        {name = "vsnip"},
        {name = "buffer"},
        {name = "nvim_lsp"},
        { name = 'spell' },
        -- {name = "nuspell"},
    },
})
