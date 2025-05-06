-- Neovim Keymaps

-- Pressing Space will do nothing in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- No more fat finger on save:
vim.keymap.set("n", ":W", ":w", { noremap = true, silent = true, desc = "which_key_ignore" })

-- Reload Neovim configuration files:
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("source $MYVIMRC") -- Reload the init.lua
	vim.notify("Neovim config reloaded!", vim.log.levels.INFO) -- Notify
end, { desc = "Reload Neovim config" })

-- Open Terminal
vim.keymap.set("n", "<leader>t", ":term<CR>a", { desc = "Open [T]erminal" })

-- Buffer
vim.keymap.set("n", "<leader>bd", ":bd%<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bp", ":bp&<CR>", { desc = "Switch to previous buffer" })
vim.keymap.set("n", "<leader>bn", ":bn&<CR>", { desc = "Switch to next buffer" })
vim.keymap.set("n", "<leader>br", vim.lsp.buf.rename, { desc = "[B]uffer [R]ename" })

-- Open NetRW
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Open Netrw" })

-- Replace visually selected text with the previously yanked text in Visual mode
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace selected with yanked" })

-- Copy to system clipboard instead of Vim's:
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy from cursor to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- For Git:
vim.keymap.set("n", "<leader>gs", ":!git status<CR>", { desc = "Run git status" })
vim.keymap.set("n", "<leader>ga", ":!git add -p<CR>", { desc = "Run git add -p" })
vim.keymap.set("n", "<leader>gc", ":!git commit<CR>", { desc = "Run git comit" })

-- Window navigation:
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>", { desc = "Move to the left window" })
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>", { desc = "Move to the right window" })
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>", { desc = "Move to the window below" })
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>", { desc = "Move to the window above" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>eN", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>ef", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Telescope Keymaps
-- Predefined Lua Modules
local ts = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", ts.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", ts.live_grep, { desc = "Find with Live Grep" })
vim.keymap.set("n", "<leader>fb", ts.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", ts.help_tags, { desc = "Find Help Tags" })
vim.keymap.set("n", "<leader>ss", ts.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>gf", ts.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", ts.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", ts.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", ts.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", ts.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", ts.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", ts.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>?", ts.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", ts.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>s/", telescope_custom.Live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
vim.keymap.set(
	"n",
	"<leader>/",
	telescope_custom.Search_current_buffer,
	{ desc = "[/] Fuzzily search in current buffer" }
)

vim.api.nvim_create_user_command("LiveGrepGitRoot", telescope_custom.Live_grep_git_root, {})
vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })

-- LSP Keymaps
vim.keymap.set("n", "<leader>gd", ts.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>gr", ts.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "<leader>gi", ts.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>gt", ts.lsp_type_definitions, { desc = "Type [D]efinition" })

vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
