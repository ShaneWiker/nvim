local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Buffers
keymap("n", "<Leader>bb", ":split<CR>", opts) --Split buffer horizontally
keymap("n", "<Leader>bv", ":vsplit<CR>", opts) --Split buffer vertically
keymap("n", "<Leader>bx", ":bd!<CR>", opts) --Delete buffer
keymap("n", "<leader>bd", ":%bd!<CR>", opts) --Delete all buffers
keymap("n", "<leader>bn", ":sp new<CR>", opts) --New buffer

--Dap
keymap("n", "<Leader>dd", ":lua require'dap'.continue()<CR>", opts) --Dap continue
keymap("n", "<Leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts) -- Dap toggle breakpoint
keymap("n", "<Leader>do", ":lua require'dap'.step_over()<CR>", opts) --Dap step over
keymap("n", "<Leader>di", ":lua require'dap'.step_into()<CR>", opts) --Dap step into
keymap("n", "<Leader>ds", ":lua require'dap'.repl.open()<CR>", opts) --Dap open repl
keymap("n", "<Leader>ds", ":lua require'dap'.repl.open()<CR>", opts) --Dap open repl

--Git
keymap("n", "<leader>ga", ":Git add .<CR>", opts) --Git add all
keymap("n", "<leader>gb", ":Git branch -M ", opts) --Git select branch
keymap("n", "<leader>gc", ":Git commit -m ", opts) --Git commit
keymap("n", "<leader>gi", ":Git init<CR>", opts) --Git initialize repo
keymap("n", "<leader>gr", ":Git remote add origin https://github.com/ShaneWiker/", opts) --Git add origin
keymap("n", "<leader>gl", ":Git pull<CR>", opts) --Git pull
keymap("n", "<leader>gp", ":Git push<CR>", opts) --Git push
keymap("n", "<leader>gs", ":Git status<CR>", opts) --Git pull

--Go to
keymap("n", "ga", "<cmd>CodeActionMenu<CR>", opts) --Go to code actions
keymap("n", "gb", "<C-^><CR>", opts) --Go back
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) --Go to definition
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) --Go to declaration
keymap("n", "gf", "<C-]><CR>", opts) --Go to tag
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) --Go to implementation
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) --Go to references

keymap("n", "<leader>sr", ":%s/", opts) --Search and replace

--LSP
keymap("n", "<Leader>li", ":LspInfo<CR>", opts) --LSP Info

--File management
keymap("n", "<Leader>ma", ":w ", opts) --Menu save as
keymap("n", "<Leader>mc", ":wqa<CR>", opts) --Menu write and quit
keymap("n", "<Leader>md", ":call delete(expand('%'))<CR>", opts) --Menu delete
keymap("n", "<Leader>mq", ":q<CR>", opts) --Menu quit
keymap("n", "<Leader>mw", ":w!<CR>", opts) --Menu write
keymap("n", "<Leader>mx", ":q!<CR>", opts) --Menu quit force
keymap("n", "<leader>mr", ":Rename! ", opts) --Menu rename

--NERDTree
keymap("n", "<Leader>nt", ":NERDTree<CR>", opts) --NERDTree

--Open
if vim.fn.hostname() == "amethyst" then
	keymap("n", "<leader>oa", ":e /home/thenomadicaspie/gfc/project/solid-leads-api/<CR>", opts)
	keymap("n", "<leader>oi", ":e /home/thenomadicaspie/.config/nvim/init.vim<CR>", opts)
	keymap("n", "<leader>ol", ":e /home/thenomadicaspie/gfc/project/solid-leads/<CR>", opts)
	keymap("n", "<leader>ok", ":e /home/thenomadicaspie/.config/nvim/lua/keymaps.lua<CR>", opts)
	keymap("n", "<leader>oc", ":e /home/thenomadicaspie/.config/nvim/lua/config.lua<CR>", opts)
	keymap("n", "<leader>oo", ":e /home/thenomadicaspie/.config/nvim/lua/options.lua<CR>", opts)
	keymap("n", "<leader>od",
		":e /home/thenomadicaspie/projects/developer_test_project_react/frontend/src/pages/userDetail.jsx<CR>", opts)
	keymap("n", "<leader>og", ":e /home/thenomadicaspie/gfc/project/<CR>", opts)
	keymap("n", "<leader>ol", ":e /home/thenomadicaspie/.config/nvim/lua/luasnips_config.lua<CR>", opts)
	keymap("n", "<leader>opn", ":e /home/thenomadicaspie/projects/psyche/src/App.js<CR><CR>", opts)
	keymap("n", "<leader>opo", ":e /home/thenomadicaspie/personal/psyche/script.js<CR><CR>", opts)
	keymap("n", "<leader>om", ":e /home/thenomadicaspie/gfc/project/marketing-ops-api<CR>", opts)
	keymap("n", "<leader>onc", ":e /home/thenomadicaspie/gfc/project/next.client<CR>", opts)
	keymap("n", "<leader>ond", ":e /home/thenomadicaspie/gfc/project/next.data<CR>", opts)
end

if vim.fn.hostname() == "TheNo" then
	keymap("n", "<leader>oa", ":e C:\\Users\\ELLE\\Desktop\\Shane\\projects\\dev_agency\\<CR>", opts)
	keymap("n", "<leader>ob", ":e C:\\Users\\ELLE\\Desktop\\Shane\\vs_code\\i_bet_you_wont\\src\\App.js<CR>", opts)
	keymap("n", "<leader>oc", ":e C:\\Users\\TheNo\\AppData\\Local\\nvim\\lua\\config.lua<CR>", opts)
	keymap("n", "<leader>oe", ":e C:\\Users\\ELLE\\Desktop\\Shane\\projects\\elle_progress\\<CR>", opts)
	keymap("n", "<leader>oe", ":e C:\\Users\\ELLE\\Desktop\\Shane\\projects\\elle_progress\\<CR>", opts)
	keymap("n", "<leader>ok", ":e C:\\Users\\TheNo\\AppData\\Local\\nvim\\lua\\keymaps.lua<CR>", opts)
	keymap("n", "<leader>oo", ":e C:\\Users\\TheNo\\AppData\\Local\\nvim\\lua\\options.lua<CR>", opts)
	keymap("n", "<leader>ot", ":e C:\\Users\\TheNo\\Desktop\\Shane\\projects\\curd_react\\frontend<CR>", opts)
	keymap("n", "<leader>or", ":e C:\\Users\\ELLE\\Desktop\\Shane\\projects\\rs_challenge_dev\\<CR>", opts)
	keymap("n", "<leader>os", ":e C:\\Users\\ELLE\\AppData\\Local\\nvim\\friendly_snippets\\snippets\\javascript\\<CR>",
		opts)
	keymap("n", "<leader>ou", ":e C:\\Users\\ELLE\\AppData\\Local\\nvim\\snippets\\<CR>", opts)
end

--Plug
keymap("n", "<leader>pi", ":PlugInstall<CR>", opts) --Plug Install
keymap("n", "<leader>ps", ":PlugStatus<CR>", opts) --Plug Status

--Snippets
keymap("n", "<leader>se", "<cmd>LuaSnipEdit<cr>", opts) --Edit LuaSnip
keymap("n", "<leader>sj", ":e /home/thenomadicaspie/.config/nvim/snippets/snippets/javascript/javascript.json<CR>", opts)

--Source
keymap("n", "<leader>sl", ":luafile %<CR>", opts) --Source lua
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts) --Source vim

--Telescope
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts) --Telescope buffers
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts) --Telescope files
keymap("n", "<leader>tg", ":Telescope live_grep<CR>", opts) --Telescope grep
keymap("n", "<leader>th", ":Telescope help_tags<CR>", opts) --Telescope help
keymap("n", "<leader>tl", ":Telescope luasnip<CR>", opts) --Telescope Luasnip
keymap("n", "<leader>ts", ":Telescope grep_string<CR>", opts) --Telescope string
keymap("n", "<space>tt", ":Telescope file_browser<CR>", opts) --Telescope show file browser

--Mundo
keymap("n", "<leader>uu", ":MundoToggle<CR>", opts) --Uses vim-mundo to visualize undo tree

--Vimwiki
keymap("n", "<leader>j", ":VimwikiFollowLink<CR>", opts) --Vimwiki follow link
keymap("n", "<leader>k", ":VimwikiGoBackLink<CR>", opts) --Vimwiki go back
keymap("n", "<leader>wd", "<Plug>VimwikiDeleteFile", opts) --Vimwiki delete file
keymap("n", "<leader>ww", ":VimwikiIndex<CR>", opts) --Vimwiki index

-- Buffers
keymap('n', '<A-,>', '<Cmd>BufSurfBack<CR>', opts) --Go to previous buffer
keymap('n', '<A-.>', '<Cmd>BufSurfForward<CR>', opts) --Go to next buffer
keymap('n', '<A-l>', '<Cmd>BufSurfList<CR>', opts) --Show all buffers
keymap("n", "<C-h>", "<C-w>h", opts) --Go to left buffer
keymap("i", "<C-h>", "<C-w>h", opts) --Go to left buffer
keymap("n", "<C-j>", "<C-w>j", opts) --Go to right buffer
keymap("i", "<C-j>", "<C-w>j", opts) --Go to right buffer
keymap("n", "<C-k>", "<C-w>k", opts) --Go to top buffer
keymap("i", "<C-k>", "<C-w>k", opts) --Go to top buffer
keymap("n", "<C-l>", "<C-w>l", opts) --Go to bottom buffer
keymap("i", "<C-l>", "<C-w>l", opts) --Go to bottom buffer
keymap("n", "<C-A-h>", ":vertical resize -5<CR>", opts) --Resize buffer vertically down
keymap("n", "<C-A-l>", ":vertical resize +5<CR>", opts) --Resize buffer vertically up
keymap("n", "<C-A-j>", ":resize -5<CR>", opts) --Resize buffer horizontally left
keymap("n", "<C-A-k>", ":resize +5<CR>", opts) --Resize buffer horizontally right
keymap("n", "<up>", "<C-w><up>", opts) --Go to top buffer
keymap("n", "<down>", "<C-w><down>", opts) --Go to bottom buffer
keymap("n", "<left>", "<C-w><left>", opts) --Go to left buffer
keymap("n", "<right>", "<C-w><right>", opts) --Go to right buffer

--Diagnostic
keymap("n", "<C-x>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) --Go to next diagnostic
keymap("n", "<C-z>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) --Go to previous diagnostic

--Quick fix
keymap("i", "<C-l>", ":TroubleToggle<CR>", opts) --Toggle Quick Fix
keymap("i", "<C-r>", ":TroubleRefresh<CR>", opts) --Refresh Quick Fix

--LuaSnip
keymap("i", "<C-E>", "<Plug>luasnip-next-choice", opts) --Go to next snippet choice
keymap("s", "<C-E>", "<Plug>luasnip-next-choice", opts) --Go to previous snippet choice
keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", opts) --Go to next snippet
keymap("i", "<Tab>", "<Plug>luasnip-expand-or-jump", opts) --Expand snippet
keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts) --Go to previous snippet
keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", opts) --Go to previous snippet

--Vim remaps
keymap("i", "jk", "<esc>", opts) --Escape
keymap("v", "J", "5j", opts) --Go down 5 lines
keymap("n", "J", "5j", opts) --Go down 5 lines
keymap("v", "K", "5k", opts) --Go up 5 lines
keymap("n", "K", "5k", opts) --Go up 5 lines
keymap("n", "n", "nzz", opts) --Next
keymap("n", "N", "Nzz", opts) --Previous
keymap("n", "Y", "y$", opts) --Yank to end of line
keymap("n", "<leader>J", "J", opts) --Combine line below

--Spell check
keymap("", "<F5>", ":setlocal spell!<CR>", opts) --Show spell check

--Terminal
keymap("n", "<Leader><CR>", ":ToggleTerm size=10 direction=horizontal<CR>", opts) --Open terminal
keymap("n", "<Leader>1<CR>", ":1ToggleTerm size=10 direction=horizontal<CR>", opts) --Open terminal 1
keymap("n", "<Leader>2<CR>", ":2ToggleTerm size=10<CR>", opts) --Open terminal 2
keymap("n", "<Leader>3<CR>", ":3ToggleTerm size=10<CR> ", opts) --Open terminal 3
keymap("n", "<Leader>4<CR>", ":4ToggleTerm size=10<CR>", opts) --Open terminal 4
keymap("n", "<Leader>5<CR>", ":5ToggleTerm size=40<CR> ", opts) --Open terminal 5
