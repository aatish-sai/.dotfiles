local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all",

    sync_install = false,
    autopairs = {
      enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" }
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    incremental_selection = {
        enable = true,
    },
    textobjects = {
        enable = true,
    },
}
