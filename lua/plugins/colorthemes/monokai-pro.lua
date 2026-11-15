return {
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      local bg_transparent = true

      local function apply_theme()
        require('monokai-pro').setup {
          transparent_background = bg_transparent,
          filter = 'octagon',
          terminal_colors = true,
          styles = {
            comment = { italic = true },
            keyword = { italic = true },
          },
        }
        vim.cmd.colorscheme 'monokai-pro-octagon'
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
