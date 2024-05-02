local map = vim.keymap.set

-- Make sure to set `mapleader` before lazy so the mappings are correct
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- BOOTSTRAP LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  { import = "acs3985.plugins" },    -- main plugins directory
  { import = "acs3985.plugins.lsp" } -- lsp plugins directory
}, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
