local remap = vim.keymap.set

-- Normal mode: Save the file
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Normal mode: Quit Neovim
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Open netrw (file explorer)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Visual mode: Move lines up and down
remap("v", "<C-k>", ":m '<-2<CR>gv=gv")
remap("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- Normal mode: Move lines up and down
remap("n", "<C-k>", ":m .-2<cr>==")
remap("n", "<leader>j", ":m .+1<cr>==")

-- Plugins Keybinds
M = {} 
function M.plugin_keybinds()
	-- Telescope Mappings
	local telescope = require("telescope.builtin")
	remap("n", "<leader>ff", telescope.find_files)	
	remap("n", "<leader>fb", telescope.buffers)
	remap("n", "<leader>fg", telescope.live_grep)
	remap("n", "<leader>fh", telescope.help_tags)
	remap("n", "<leader>fk", telescope.keymaps)
	remap("n", "<leader>fr", telescope.oldfiles)

	-- Oil Explorer
	remap('n', '<leader>e', ':Oil<CR>')

	end

return M

