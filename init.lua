-- Nvim Configuration
-- IDEAS
-- 1.make telescope mapping for adding a file as a split
-- 2.make mapping for closing split without deleting buffer

require'plugins'
require'settings'
require'test'

vim.opt.showtabline = 2
-- vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'
vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'

local formatTab = require'luatab'.formatTab
require'luatab'.tabline = function()
    local i = 1
    local line = ''
    while i <= vim.fn.tabpagenr('$') do
        line = line .. vim.lsp.diagnostic.get_count(0, [[Error]]) .. formatTab(i)
        i = i + 1
    end

    return  line .. '%T%#TabLineFill#%='
end
