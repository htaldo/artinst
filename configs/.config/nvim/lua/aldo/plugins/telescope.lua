return {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{"<leader>pf", ":Telescope find_files<cr>"},
		{"<C-p>", ":Telescope git_files<cr>"},
		{"<leader>ps", function()
			require 'telescope.builtin'.grep_string(
			{ search = vim.fn.input("Grep > ") });
		end
		},
	}
}
