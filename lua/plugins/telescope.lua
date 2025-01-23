return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { remap = false, silent = true })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { remap = false, silent = true })
			vim.keymap.set("n", "<leader>gb", builtin.buffers, { remap = false, silent = true })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { remap = false, silent = true })
		end,
	},
}
