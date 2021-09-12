local f = function ()
    local x = 0;
    print ( x )
end

function Test()
    local pos = vim.lsp.util.make_position_params()
    local name = "new_name"
    pos.newName = name

    vim.lsp.buf_request(0, "textDocument/rename", pos, function (err, method, result, ...)
       -- print(err, method, result, name)

        vim.lsp.handlers["textDocument/rename"](err, method, result, ...)
    end)
end
