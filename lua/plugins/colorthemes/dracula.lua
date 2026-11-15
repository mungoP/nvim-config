return {
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local dracula = require 'dracula'

      -- Initial setup
      local bg_transparent = true
      dracula.setup {
        transparent_bg = bg_transparent,
        italic_comment = true,
        show_end_of_buffer = true,
      }
      vim.cmd [[colorscheme dracula]]

      -- Toggle background transparency
      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        dracula.setup {
          transparent_bg = bg_transparent,
          italic_comment = true,
          show_end_of_buffer = true,
        }
        vim.cmd [[colorscheme dracula]]
      end

      -- Map <leader>bg to toggle transparency
      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },
}
