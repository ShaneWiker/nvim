local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
null
end

vim.g.mapleader = ' '

null
local opts = { noremap = true, silent = true }

--Buffers
null
null
null
null
null

--Dap
null
null
null
null
null
null

--Git
null
null
null
null
null
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>'
	, { silent = true })
null
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>'
	, {})
null
null
null
null
null

--Go to
null
null
null
null
null
null
null

--LSP
null

--Bookmarks
null
null
null
null
null
null
null
null

--File management
null
null
null
null
null
null
null

--NERDTree
null

--Open
if vim.fn.hostname() == "amethyst" then
null
null
null
null
null
null
null
		":e /home/thenomadicaspie/projects/developer_test_project_react/frontend/src/pages/userDetail.jsx<CR>", opts)
null
null
null
null
null
null
null
null
end

if vim.fn.hostname() == "TheNo" then
null
null
null
null
null
null
null
null
null
null
		opts)
null
end

--Plug
null
null

--Snippets
null
null

--Source
null
null

--Telescope
null
null
null
null
null
null
null

--Mundo
null

--Vimwiki
null
null
null
null

-- Buffers
null
null
null
null
null
null
null
null
null
null
null
null
null
null
null
null
null
null
null

--Diagnostic
null
null

--Quick fix
null
null

--LuaSnip
null
null
null
null
null
null

--Vim remaps
null
null
null
null
null
null
null
null
null

--Replace
null

--Spell check
null

--Terminal
null
null
null
null
null
null
