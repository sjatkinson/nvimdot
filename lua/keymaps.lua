local M = {}

function M.normal(o)
    for i,v in ipairs(o) do
        vim.api.nvim_set_keymap("n", v[1], v[2], {});
    end
end

return M
