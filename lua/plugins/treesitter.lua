return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Add this line to ensure the plugin is loaded
    local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not status_ok then
      return
    end
    
    treesitter.setup({
      ensure_installed = {
        'lua', 'python', 'javascript', 'typescript', 'vimdoc',
        'vim', 'regex', 'terraform', 'sql', 'dockerfile', 
        'toml', 'json', 'java', 'groovy', 'go', 'gitignore',
        'graphql', 'yaml', 'make', 'cmake', 'markdown',
        'markdown_inline', 'bash', 'tsx', 'css', 'html',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    })
  end,
}
