return {
	{ 'kepano/flexoki-neovim', name = 'flexoki' },
    {
        "mcauley-penney/tidy.nvim",
        config = function ()
            require("tidy").setup {}
        end
    }
}
