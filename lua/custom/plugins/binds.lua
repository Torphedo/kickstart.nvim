-- Allows us to do Shift-J / Shift-K in visual line select mode to move lines around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Make searching and paging up and down keep the screen centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Search-replace
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>y', '"+y')

-- Easy bind to make files executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

-- File tree
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>e', '<C-w>n:Ex<CR>')
vim.keymap.set('n', '<leader>t', ':terminal<CR>')
vim.opt.number = true
vim.opt.relativenumber = true

-- 4 space tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable swapfile and make undos persist in a file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

-- CMake keybinds
vim.keymap.set('n', '<F3>', ':CMakeGenerate<CR>')
vim.keymap.set('n', '<F7>', ':CMakeBuild<CR>')
vim.keymap.set('n', '<F5>', ':CMakeRun<CR>')

vim.keymap.set('n', '<A-h>', '<Cmd>NvimTmuxNavigateLeft<CR>')
vim.keymap.set('n', '<A-j>', '<Cmd>NvimTmuxNavigateDown<CR>')
vim.keymap.set('n', '<A-k>', '<Cmd>NvimTmuxNavigateUp<CR>')
vim.keymap.set('n', '<A-l>', '<Cmd>NvimTmuxNavigateRight<CR>')

return {
  'alexghergh/nvim-tmux-navigation',
  'navarasu/onedark.nvim',
  dependencies = {
    ---
    -- N/A
    ---
  },
  config = function()
    -- I cannot for the life of me figure out how to make this override the
    -- color scheme set in the main init.lua...
    require('onedark').load()
    vim.cmd.colorscheme 'onedark'

    local nvim_tmux_nav = require 'nvim-tmux-navigation'

    nvim_tmux_nav.setup {
      disable_when_zoomed = true, -- defaults to false
    }
  end,
}
