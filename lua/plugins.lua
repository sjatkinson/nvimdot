local Plugins = {}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'


function Plugins.use(plugs)
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
        return 
    end
    vim.cmd [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
    ]]
    local packer = require('packer')
    packer.init()
    packer.use 'wbthomason/packer.nvim' -- Package manager
    for i = 1, #plugs do
        packer.use(plugs[i])
    end
end

return Plugins
