local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

local cmp_window = require("cmp.config.window")
local cmp_types = require("cmp.types.cmp")

-- local comp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
-- if comp_autopairs_ok then
-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
			mode = "symbol_text",
			symbol_map = { Copilot = "" },
			-- menu = {
			-- 	buffer = "[Buffer]",
			-- 	nvim_lsp = "[LSP]",
			-- 	luasnip = "[LuaSnip]",
			-- 	nvim_lua = "[Lua]",
			-- 	latex_symbols = "[Latex]",
			-- 	path = "[Path]",
			-- 	copilot = "[Copilot]",
			-- },
		}),
	},
	window = {
		completion = cmp_window.bordered(),
		documentation = cmp_window.bordered(),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				local confirm_opts = {
					behavior = cmp_types.ConfirmBehavior.Replace,
					select = false,
				}

				local is_insert_mode = function()
					return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
				end
				if is_insert_mode() then -- prevent overwriting brackets
					confirm_opts.behavior = cmp_types.ConfirmBehavior.Insert
				end

				local entry = cmp.get_selected_entry()
				local is_copilot = entry and entry.source.name == "copilot"
				if is_copilot then
					confirm_opts.behavior = cmp_types.ConfirmBehavior.Replace
					confirm_opts.select = true
				end

				if cmp.confirm(confirm_opts) then
					return -- success, exit early
				end
			end

			fallback() -- if not exited early, always fallback
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "copilot", max_item_count = 3 },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
