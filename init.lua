-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- My highlights
-- Don't know how to configure the pocco81/auto-save.nvim plugin to _only_ save on focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  command = "silent! wall",
})

vim.wo.relativenumber = false
vim.wo.wrap = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.g.loaded_netrwPlugin = true -- Otherwise, orgmode refuses to open URLs
