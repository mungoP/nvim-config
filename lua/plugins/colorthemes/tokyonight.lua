return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,

    config = function()
      local bg_transparent = true

      local function apply_theme()
        require('tokyonight').setup {
          style = 'night', -- important
          transparent = bg_transparent,
          styles = {
            comments = { italic = true },
            keywords = { italic = true },
            sidebars = bg_transparent and 'transparent' or 'dark',
            floats = bg_transparent and 'transparent' or 'dark',
          },
        }

        vim.cmd 'colorscheme tokyonight'
        vim.cmd 'doautocmd ColorScheme tokyonight'
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
