-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.clipboard = "unnamed"

-- Copy to clipboard 
vim.keymap.set({'n', 'v'}, "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Shortcuts for Nvim Tree Plugin
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Shortcuts for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Show hidden symbols
vim.opt.list = true
vim.opt.listchars = {
  tab = "->",
  trail = "~",
  precedes = "<",
  extends = ">",
  eol = "␤"
}

-- Return to last position after exit nvim
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
      vim.api.nvim_command("normal! g`\"")
    end
  end,
})

