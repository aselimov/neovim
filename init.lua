-- set to true for light mode
vim.g.light_mode = true

-- Neovim configuration
-- Modularized structure for better organization

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- Setup lazy.nvim and load plugins
require("lazy").setup({
	-- Import all plugin configurations
	{ import = "plugins" },
})

-- Load additional configuration
require("colorizer").setup()
require("config.formatting")
