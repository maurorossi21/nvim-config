return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()	
			lspconfig.ruff.setup({
				on_attach = custom_attach,
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				on_attach = custom_attach,
				capabilities = capabilities,
			})
		end
	}
}
