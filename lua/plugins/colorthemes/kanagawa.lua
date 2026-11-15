return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,

    config = function()
      local bg_transparent = true

      local function apply_theme()
        require('kanagawa').setup {
          theme = 'wave', -- wave, dragon, lotus
          transparent = bg_transparent,
          commentStyle = { italic = true },
          keywordStyle = { italic = true },
          colors = {
            theme = {
              all = {
                ui = {
                  -- make the gutter (line numbers / signs) match the background
                  bg_gutter = bg_transparent and 'none' or nil,
                },
              },
            },
          },
        }
        vim.cmd.colorscheme 'kanagawa'
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
