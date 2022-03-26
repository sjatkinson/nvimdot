local Options = {}

function Options.set_options(o)
    for k,v in pairs(o) do
        vim.opt[k] = v
    end
end

function Options.set_globals(o)
    for k,v in pairs(o) do
        vim.g[k] = v
    end
end

function Options.set_vim_options(o)
    for i = 1, #o do
        vim.cmd(o[i])
    end
end

return Options
