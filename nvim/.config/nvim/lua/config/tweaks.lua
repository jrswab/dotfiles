-- Custom tweaks to Neovim

-- Only Use Tabs (no spaces) when tab is pressed:
vim.o.autoindent = true -- adjust the indent of new lines based on previous line’s indent.
vim.o.expandtab = false -- disable inserting spaces when tab is pressed.
vim.o.tabstop = 2 -- sets the "spaces" viewed per tab.
vim.o.shiftwidth = 2 -- sets the "spaces" for indentation.

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- No Top banner in Netrw:
vim.g.netrw_banner = 0

-- Tree View in Netrw:
vim.g.netrw_liststyle = 3

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
--vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.colorcolumn = "120"
