local Plugins = {}
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- TODO: what to do the first time when plenary is not installed yet?
local ft = require "plenary.filetype"
local Path = require "plenary.path"


function Plugins.init(plugs)
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
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

    local cfg = vim.fn.stdpath 'config' .. '/plugins-config' 
    local uv = vim.loop

    local handle = uv.fs_scandir(cfg)
    if handle ~= nil then
        while true do
            local name = uv.fs_scandir_next(handle)
            if name == nil then
                break
            end
            local p = Path:new(cfg):joinpath(name)
            ext = ft.detect_from_extension(name)
            if ext == "vim" then
                local c = "source " .. p:normalize()
                vim.cmd(c)
            elseif ext == "lua" then
                print("got a lua file")
            else
                -- should we do something here or just ignore
                print("Something else")
            end
            -- if a vim file
            -- else a lua file
        end
    end
end

return Plugins
