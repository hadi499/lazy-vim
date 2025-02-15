return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.volar.setup {
				-- add filetypes for typescript, javascript and vue
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				init_options = {
					vue = {
						-- disable hybrid mode
						hybridMode = false,
					},
					typescript = {
						-- replace with your global TypeScript library path
						tsdk = '/home/hadi/.nvm/versions/node/v20.18.2/lib/node_modules/typescript/lib'
					}
				},
			}

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
   					 Lua = {
     						 diagnostics = {
       						 globals = {'vim'}
     				 		}
   						}
 				 }
			})

			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "htmldjango", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
