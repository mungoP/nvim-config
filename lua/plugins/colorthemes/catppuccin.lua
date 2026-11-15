return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,

    config = function()
      local bg_transparent = true
      local function apply_theme()
        require('catppuccin').setup {
          flavour = 'mocha', -- latte, frappe, macchiato, mocha
          transparent_background = bg_transparent,
          styles = {
            comments = { 'italic' },
            keywords = { 'italic' },
          },
        }
        vim.cmd.colorscheme 'catppuccin-mocha'
      end
      -- Apply initially
      apply_theme()
      -- Toggle function
      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        apply_theme()
      end
      -- Keymap
      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },
}
