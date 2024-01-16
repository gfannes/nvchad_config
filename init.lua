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

-- My indentation settings
-- This is _not_ the same as formatting with conform
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- Use spaces iso tabs
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 0
    vim.opt.softtabstop = 0
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Use tabs iso spaces to be compatible with Obsidian
    vim.opt.expandtab = false
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 0
    vim.opt.softtabstop = 0
  end,
})

vim.wo.relativenumber = false
vim.wo.wrap = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.g.loaded_netrwPlugin = true -- Otherwise, orgmode refuses to open URLs
