vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.g.mapleader = ' '
vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>e', ':q<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>s', ':w<CR>', { silent = true, noremap = true })

vim.keymap.set('t','<Esc>',[[<C-\><C-n>]],{ noremap = true,silent = true })

local lazy = require('./Lazy')
lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

lazy.download()

local plugins = require('plugins')

lazy.setup(plugins.plugs)

plugins.start()

