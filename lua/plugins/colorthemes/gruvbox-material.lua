return {
  {
    'f4z3r/gruvbox-material.nvim',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,

    config = function()
      local gruvbox = require 'gruvbox-material'

      -- Initial background state
      local bg_transparent = true

      local function apply_theme()
        gruvbox.setup {
          italics = true,
          contrast = 'hard',

          comments = {
            italics = true,
          },

          background = {
            transparent = bg_transparent,
          },

          float = {
            force_background = false,
            background_color = nil,
          },

          signs = {
            force_background = false,
            background_color = nil,
          },

          customize = nil,
        }

        vim.cmd.colorscheme 'gruvbox-material'
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
