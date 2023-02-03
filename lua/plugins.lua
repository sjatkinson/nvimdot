-- Simple wrapper for Packer to manage my plugins
local M = {}

-- Configures packer and 'uses' the lists of plugins passed in
function M.use(plugs)
    local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
    local bootstrapping = false

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        bootstrapping = true
        vim.fn.system { 'git', 'clone', '--depth', '1', 
            'https://github.com/wbthomason/packer.nvim', install_path }
        vim.cmd('packadd packer.nvim')
    end

    local packer = require('packer')
    packer.init()
    packer.use 'wbthomason/packer.nvim' -- Package manager
    for i = 1, #plugs do
        packer.use(plugs[i])
    end

    if bootstrapping then
        packer.sync()
    end

    return bootstrpping
end

return M
