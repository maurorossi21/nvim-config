
return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			-- "hrsh7th/cmp-nvim-lua",
			-- 'hrsh7th/cmp-cmdline',
			-- "hrsh7th/cmp-buffer",
		},
		config = function()
			-- cmp
			local cmp = require("cmp")

			cmp.setup({
				formatting = {
					-- width fix if words are too long
					format = function(entry, vim_item)
						vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
						-- luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<ESC>"] = cmp.mapping.abort(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "luasnip" },
					{ name = "nvim_lua " },
					{ name = "path" },
				}),
			})
			-- bracket completion after functions in py/lua etc.
			local cmp_ap = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_ap.on_confirm_done())
		end,
	},
}
