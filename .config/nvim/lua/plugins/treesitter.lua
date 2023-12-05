return {
	{
        "nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"c", "lua", "vim", "php", "vimdoc", "rust", "javascript", "typescript", "python", "html", "css", "cpp"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
