local plugins = {
	plugs = {
		{ 'folke/tokyonight.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-tree/nvim-tree.lua' },
		{ 'andymass/vim-matchup' },
		{ 'akinsho/toggleterm.nvim', version = "*", config = true },

		-- JavaScript LSP & Autocompletion
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
		{ 'saadparwaiz1/cmp_luasnip' },
	},

	start = function()
		vim.cmd.colorscheme('tokyonight')

		require("nvim-tree").setup({})
		require("toggleterm").setup {
			direction = "horizontal",
			size = 15,
			open_mapping = '<leader>t',
		}

		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = { "ts_ls","clangd" }, -- JavaScript/TypeScript LSP
		}
		require("luasnip.loaders.from_vscode").lazy_load()

		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({})
		lspconfig.clangd.setup({})

		-- nvim-cmp setup
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}
		})
	end
}

return plugins
