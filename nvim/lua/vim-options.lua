vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false
-- Set general editor options
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Show relative line numbers
vim.opt.expandtab = true            -- Convert tabs to spaces
vim.opt.smartindent = true          -- Enable smart indentation
-- vim.opt.wrap = false                -- Disable line wrapping
vim.opt.cursorline = true           -- Highlight the current line
vim.opt.termguicolors = true        -- Enable 24-bit RGB colors
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard
vim.opt.splitright = true           -- Open vertical splits to the right
vim.opt.splitbelow = true           -- Open horizontal splits below
vim.opt.ignorecase = true           -- Ignore case in searches
vim.opt.smartcase = true            -- Override ignorecase if uppercase is used
vim.opt.scrolloff = 8               -- Keep 8 lines visible when scrolling
vim.opt.ruler = true
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
