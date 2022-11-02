local Plugins = {}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

function join(base, path)
    return base .. "/" .. path
end

function extension(path)
    pat = "%.%a%a%a"
    ext_start, ext_end = string.find(path, pat)
    if not ext_start then
        return nil
    end
    return string.sub(path, ext_start+1, ext_end)
end

function Plugins.configure(cfg_path)
    local cfg = vim.fn.stdpath 'config' .. "/" .. cfg_path
    local uv = vim.loop

    local handle = uv.fs_scandir(cfg)
    if handle ~= nil then
        while true do
            local name = uv.fs_scandir_next(handle)
            if name == nil then
                break
            end
            local p = join(cfg, name)
            ext = extension(name)
            if ext == "vim" or ext == "lua" then
                local c = "source " .. p
                vim.cmd(c)
            else
                -- should we do something here or just ignore
                print("unknown config file" .. name)
            end
            -- if a vim file
            -- else a lua file
        end
    end
end

function Plugins.use(plugs)
    local packer = require('packer')
    packer.init()
    packer.use 'wbthomason/packer.nvim' -- Package manager
    for i = 1, #plugs do
        packer.use(plugs[i])
    end
end

function Plugins.init()
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    end
    vim.cmd [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
    ]]
end


return Plugins
