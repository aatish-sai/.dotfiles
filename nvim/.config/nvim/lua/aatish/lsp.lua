-- Mappings
local opts = { noremap=true, silent=true}

-- easy lsp installer
local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local servers = { 'jsonls', 'sumneko_lua', 'pyright' }

lsp_installer.setup {
    ensure_installed = servers
}

-- LSP config
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function config(_config)
    return vim.tbl_deep_extend('force', {
        capabilities = capabilities,
        on_attach = on_attach,
    }, _config or {})
end

lspconfig.sumneko_lua.setup(config({
    settings ={
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

lspconfig.pyright.setup(config())

lspconfig.jsonls.setup(config())
