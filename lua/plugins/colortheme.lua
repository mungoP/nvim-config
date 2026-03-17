-- return {
--   {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1000,
--     lazy = false,
--
--     config = function()
--       local bg_transparent = true
--       local function apply_theme()
--         require('catppuccin').setup {
--           flavour = 'mocha', -- latte, frappe, macchiato, mocha
--           transparent_background = bg_transparent,
--           styles = {
--             comments = { 'italic' },
--             keywords = { 'italic' },
--           },
--         }
--         vim.cmd.colorscheme 'catppuccin-mocha'
--       end
--       -- Apply initially
--       apply_theme()
--       -- Toggle function
--       local toggle_transparency = function()
--         bg_transparent = not bg_transparent
--         apply_theme()
--       end
--       -- Keymap
--       vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end,
--   },
-- }
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

-- return {
--   {
--     'f4z3r/gruvbox-material.nvim',
--     name = 'gruvbox-material',
--     lazy = false,
--     priority = 1000,
--
--     config = function()
--       local gruvbox = require('gruvbox-material')
--
--       -- Initial background state
--       local bg_transparent = false
--
--       local function apply_theme()
--         gruvbox.setup({
--           italics = true,
--           contrast = "hard",
--
--           comments = {
--             italics = true,
--           },
--
--           background = {
--             transparent = bg_transparent,
--           },
--
--           float = {
--             force_background = false,
--             background_color = nil,
--           },
--
--           signs = {
--             force_background = false,
--             background_color = nil,
--           },
--
--           customize = nil,
--         })
--
--         vim.cmd.colorscheme('gruvbox-material')
--       end
--
--       -- Apply initially
--       apply_theme()
--
--       -- Toggle function
--       local toggle_transparency = function()
--         bg_transparent = not bg_transparent
--         apply_theme()
--       end
--
--       -- Keymap
--       vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end,
--   },
-- }
-- return {
--   {
--     'Mofiqul/dracula.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       local dracula = require("dracula")
--
--       -- Initial setup
--       local bg_transparent = false
--       dracula.setup({
--         transparent_bg = bg_transparent,
--         italic_comment = true,
--         show_end_of_buffer = true,
--       })
--       vim.cmd [[colorscheme dracula]]
--
--       -- Toggle background transparency
--       local toggle_transparency = function()
--         bg_transparent = not bg_transparent
--         dracula.setup({
--           transparent_bg = bg_transparent,
--           italic_comment = true,
--           show_end_of_buffer = true,
--         })
--         vim.cmd [[colorscheme dracula]]
--       end
--
--       -- Map <leader>bg to toggle transparency
--       vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--     end,
--   }
-- }
