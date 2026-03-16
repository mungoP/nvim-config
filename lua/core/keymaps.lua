-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- exit insert mode
vim.keymap.set('i', '<C-c>', '<Esc>', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete character without copying into register
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Scroll LSP hover float
vim.keymap.set('n', '<C-f>', function()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_call(win, function()
        vim.cmd 'normal! \4' -- <C-d>
      end)
      return
    end
  end
  -- fallback to default C-f if no float is open
  vim.cmd 'normal! \6'
end, { desc = 'Scroll hover float down' })

vim.keymap.set('n', '<C-b>', function()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_call(win, function()
        vim.cmd 'normal! \21' -- <C-u>
      end)
      return
    end
  end
  -- fallback to default C-b if no float is open
  vim.cmd 'normal! \2'
end, { desc = 'Scroll hover float up' })
-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers - Updated to use bufdelete.nvim
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
-- Smart buffer close with bufdelete.nvim (maintains window layout)
vim.keymap.set('n', '<leader>x', function()
  require('bufdelete').bufdelete(0, false)
end, { desc = 'Close buffer (smart)' })
-- Force close buffer (like :bdelete!)
vim.keymap.set('n', '<leader>X', function()
  require('bufdelete').bufdelete(0, true)
end, { desc = 'Force close buffer' })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Optional: Close all other buffers
vim.keymap.set('n', '<leader>xo', function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      require('bufdelete').bufdelete(buf, false)
    end
  end
end, { desc = 'Close other buffers' })

-- Window management
vim.keymap.set('n', '<leader>h', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>v', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Clear search highlighting and register
vim.keymap.set('n', '<Esc>', function()
  vim.cmd 'nohl'
  vim.fn.setreg('/', '') -- Clear the search register
end, { desc = 'Clear search highlighting and search register' })

-- In insert mode, Option+Delete deletes previous word
vim.keymap.set('i', '<A-BS>', '<C-w>', { desc = 'Delete previous word' })
