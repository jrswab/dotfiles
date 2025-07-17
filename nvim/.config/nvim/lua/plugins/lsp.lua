return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup()
		require("mason").setup()
		require("mason-lspconfig")

		-- Enable the following language servers
		local servers = {
			gopls = { filetypes = { "go" } },
			templ = { filetypes = { "templ" } },
			harper_ls = {
				settings = {
					["harper-ls"] = {
						linters = {
							SentenceCapitalization = false,
							SpellCheck = false,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
					},
				},
			},
		}

		-- Setup the language servers
		local lspconfig = require("lspconfig")
		for server, config in pairs(servers) do
			lspconfig[server].setup(config)
		end
	end,
}
