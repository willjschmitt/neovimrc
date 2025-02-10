vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Shows whitespace (except spaces).
vim.o.list = true
vim.o.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"

-- Turn on line numbers.
vim.o.number = true


-- Configure spaces as tabs.
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Maps k,j to Esc for more ergonomic exit from insert mode.
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })
