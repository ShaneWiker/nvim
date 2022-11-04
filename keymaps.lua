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
keymap("n", "<Leader>ds", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<Leader>ds", ":lua require'dap'.repl.open()<CR>", opts)

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

--Navigation
keymap("n", "<leader>J", "J", opts)
keymap("n", "<leader>K", "K", opts)

--LSP
keymap("n", "<Leader>li", ":LspInfo<CR>", opts)

--File management
keymap("n", "<Leader>ma", ":w ", opts) --Menu save as
keymap("n", "<Leader>mc", ":wqa<CR>", opts) --Menu write and quit
keymap("n", "<Leader>md", ":call delete(expand('%'))<CR>", opts) --Menu delete
keymap("n", "<Leader>mq", ":q<CR>", opts) --Menu quit
keymap("n", "<Leader>mw", ":w!<CR>", opts) --Menu write
keymap("n", "<Leader>mx", ":q!<CR>", opts) --Menu quit force
keymap("n", "<leader>mr", ":Rename! ", opts) --Menu rename

--NERDTree
keymap("n", "<Leader>nt", ":NERDTree<CR>", opts)

--Plug
keymap("n", "<leader>pi", ":PlugInstall<CR>", opts)
keymap("n", "<leader>ps", ":PlugStatus<CR>", opts)

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
	keymap("n", "<leader>oss", ":LuaSnipEdit<CR>", opts)
	keymap("n", "<leader>osj", ":e /home/thenomadicaspie/.config/nvim/snippets/snippets/javascript/javascript.json<CR>",
		opts)
	keymap("n", "<leader>om", ":e /home/thenomadicaspie/gfc/project/marketing-ops-api<CR>", opts)
	keymap("n", "<leader>onc", ":e /home/thenomadicaspie/gfc/project/next.client<CR>", opts)
	keymap("n", "<leader>ond", ":e /home/thenomadicaspie/gfc/project/next.data<CR>", opts)

	keymap("n", "<Leader>ott", ":ToggleTerm size=10 direction=horizontal<CR>", opts)
	keymap("n", "<Leader>ot1", ":1ToggleTerm size=10 direction=horizontal<CR>", opts)
	keymap("n", "<Leader>ot2", ":2ToggleTerm size=10<CR>", opts)
	keymap("n", "<Leader>ot3", ":3ToggleTerm size=10<CR> ", opts)
	keymap("n", "<Leader>ot4", ":4ToggleTerm size=10<CR>", opts)
	keymap("n", "<Leader>ot5", ":5ToggleTerm size=40<CR> ", opts)
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
keymap("n", "<leader>j", ":VimwikiFollowLink<CR>", opts)
keymap("n", "<leader>k", ":VimwikiGoBackLink<CR>", opts)
keymap("n", "<leader>wd", "<Plug>VimwikiDeleteFile", opts)
keymap("n", "<leader>wg", "<Plug>VimwikiDiaryGenerateLinks", opts)
keymap("n", "<leader>wh", "<Plug>VimwikiDecrementListItem", opts)
keymap("n", "<leader>wl", "<Plug>VimwikiIncrementListItem", opts)
keymap("n", "<leader>wn", "<Plug>VimwikiMakeDiaryNote", opts)
keymap("n", "<leader>wt", "<Plug>VimwikiMakeTomorrowDiaryNote", opts)
keymap("n", "<leader>ww", ":VimwikiIndex<CR>", opts)
keymap("n", "<leader>wy", "<Plug>VimwikiMakeYesterdayDiaryNote<CR>", opts)
keymap("n", "<leader>w,", "<Plug>VimwikiDiaryPrevDay", opts)
keymap("n", "<leader>w.", "<Plug>VimwikiDiaryNextDay", opts)
keymap("n", "<leader>:", "@:", opts)
keymap("n", "<leader>@", "@@", opts)
keymap("n", "<leader>[", "[{", opts)
keymap("n", "<leader>]", "]}", opts)
keymap("n", "<leader>/", "<Plug>tgRawSearch", opts)
keymap("n", "<leader>ia", "gg=G", opts)

-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufSurfBack<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufSurfForward<CR>', opts)
keymap('n', '<A-l>', '<Cmd>BufSurfList<CR>', opts)

keymap("n", "<A-l>", ":call vimspector#StepInto()<CR>", {})
keymap("n", "<A-h>", ":call vimspector#Continue()<CR>", {})

keymap("n", "<A-S-j>", "<C-d>", {})
keymap("n", "<A-S-k>", "<C-u>", {})

keymap("n", "<c-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<c-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true, })
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("i", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("i", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("i", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("i", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-p>", ":terminal {start C:\\Users\\ELLE\\Desktop\\Shane\\music\\elle_1.ly}", opts)
keymap("n", "<c-x>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<c-z>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("i", "<c-l>", ":TroubleToggle<CR>", opts)
keymap("i", "<c-r>", ":TroubleRefresh<CR>", opts)

keymap("i", "<C-E>", "<Plug>luasnip-next-choice", opts)
keymap("s", "<C-E>", "<Plug>luasnip-next-choice", opts)

keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", opts)
keymap("i", "<Tab>", "<Plug>luasnip-expand-or-jump", opts)
keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", opts)

keymap("n", "<C-A-h>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-A-l>", ":vertical resize +5<CR>", opts)
keymap("n", "<C-A-j>", ":resize -5<CR>", opts)
keymap("n", "<C-A-k>", ":resize +5<CR>", opts)

keymap("n", "<up>", "<C-w><up>", opts)
keymap("n", "<down>", "<C-w><down>", opts)
keymap("n", "<left>", "<C-w><left>", opts)
keymap("n", "<right>", "<C-w><right>", opts)

keymap("n", "cm", ":ConvertMapToLua<CR>", opts)
keymap("n", "D", "\\\"_d", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("i", "jk", "<esc>", opts)
keymap("v", "J", "5j", opts)
keymap("n", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("n", "K", "5k", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "Y", "y$", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("", "<F5>", ":setlocal spell!<CR>", opts)

vim.keymap.set(
	'n',
	'<leader>cc', -- e.g. '<leader>c`
	function()
		vim.cmd('term curl ' .. vim.fn.getreg('+'):gsub('\n', ''))
	end,
	{}
)

-- More Settings --

vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", opts)
