-- Simple wrapper for Packer to manage my plugins
local M = {}

-- Configures packer and 'uses' the lists of plugins passed in
function M.use(plugs)
    local lazypath = vim.fn.stdpath "data"  .. "lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    local lazy = require('lazy')
    lazy.setup(plugs)
end

return M
