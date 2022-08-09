:let mapleader = "\<Space>"

filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
filetype on
syntax on

set ma

let g:polyglot_disabled = ['markdown']
let g:prettier#config#semi = 'false'

"
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

"let g:UltiSnipsExpandTrigger="<tab>"                                            
"let g:UltiSnipsListSnippets="<c-tab>"                                            
"let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
"let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snip"]

set tags=./tags,tags;
set autoread

let g:incsearch#auto_nohlsearch = 1

let g:gutentags_enabled = 1

set foldmethod=indent
set nofoldenable

if hostname() == 'LAPTOP-5C92PE9G'
let g:vimwiki_list = [{'path': 'C:/Users/ELLE/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki' }]
nnoremap <leader>oi :e C:\Users\Elle\AppData\Local\nvim\init.vim<CR>
"nnoremap <leader>os :e C:\Users\ELLE\Desktop\Shane\projects\song_plug_app\src\App.js<CR>
nnoremap <leader>ol :e C:\Users\Elle\AppData\Local\nvim\lua\lua_config.lua<CR>
nnoremap <leader>os :e C:\Users\ELLE\AppData\Local\nvim\friendly_snippets\snippets\javascript\javascript.json<CR>
"nnoremap <leader>os :e C:\Users\TheNo\Desktop\Shane\projects\song_plug\src\App.js<CR>
else
let g:vimwiki_list = [{'path': 'C:/Users/TheNomad/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki'}]
nnoremap <leader>oi :e C:\Users\TheNo\AppData\Local\nvim\init.vim<CR>
endif

let g:vimwiki_global_ext = 0
let g:vimwiki_conceallevel = 1

let g:vimwiki_folding = 'custom'

let g:vimwiki_url_maxsave = 0
"let g:vimwiki_list = [{'path': 'Users/thenomadicaspie/vimwiki/diary/', 'auto_diary_index': 1}]

let g:suda#prompt = ''
let g:suda_smart_edit = 1

"source ~/.config/nvim/plug-config/lsp-config.vim

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {
			\ 'colorscheme': 'nord',
			\ 'component': {
			\ 'spell': '%{&spell?"SPELL":""}',
			\ 'lineinfo': '%3l/%1L:%-2c'},
			\ 'active': {
			\ 'left': [ [ 'mode', 'paste', 'spell' ],
			\ ['gitbranch', 'readonly', 'filename' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\ [ 'filetype' ], [ 'linter_errors' ], [ 'lsp_diagnostics_hints' ], [ 'lsp_diagnostics_warnings' ], [ 'lsp_diagnostics_errors' ] ] },
			\ 'inactive': {
			\ 'left': [ ['filename'] ],
			\ 'right': [ ['filetype'] ] },
			\ 'component_function': {
			\ 'gitbranch': 'FugitiveHead',
			\ 'filename': 'LightlineFilename',
			\ 'lsp_diagnostics_hints': 'LspHints',
			\ 'lsp_diagnostics_warnings': 'LspWarnings',
			\ 'lsp_diagnostics_errors': 'LspErrors',
			\ }
			\ }
let g:lightline.component_expand = {
			\ 'linter_errors': 'lightline#ale#errors'
			\ }
let g:lightline.component_type = {
			\ 'linter_errors': 'warning'
			\ }
function! LightlineFilename()
	let filename = expand('%:~:.') !=# '' ? expand('%:~:.') : '[No Name]'
	let modified = $modified ? ' +' : ''
	return filename . modified
endfunction

function! LspHints() abort
	let sl = ''
	if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
		let sl.=':'
		let sl.= luaeval("vim.lsp.diagnostic.get_count(0, [[Hint]])")
	else
		let sl.=''
	endif
	return sl
endfunction

function! LspWarnings() abort
	let sl = ''
	if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
		let sl.=' :'
		let sl.= luaeval("vim.lsp.diagnostic.get_count(0, [[Warn]])")
	else
		let sl.=''
	endif
	return sl
endfunction

function! LspErrors() abort
	let sl =''
	if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
		let sl.=':'
		let sl.= luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
	else
		let sl.=''
	endif
	return sl
endfunction

lua << EOF
-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
		underline = true,
    signs = true,
    update_in_insert = false,
  }
)

-- Send diagnostics to quickfix list
do
  local method = "textDocument/publishDiagnostics"
  local default_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
    default_handler(err, method, result, client_id, bufnr, config)
    local diagnostics = vim.diagnostic.get()
    local qflist = {}
    for bufnr, diagnostic in pairs(diagnostics) do
      for _, d in ipairs(diagnostic) do
        d.bufnr = bufnr
        d.lnum = d.range.start.line + 1
        d.col = d.range.start.character + 1
        d.text = d.message
        table.insert(qflist, d)
      end
    end
    --vim.lsp.util.set_qflist(qflist)
	--vim.diagnostic.setqflist()
	--vim.diagnostic.setloclist()
	end
end
EOF

call plug#begin('~/.local/share/nvim/plugged')
Plug 's1n7ax/nvim-terminal'
Plug 'simnalamburt/vim-mundo'
"Plug 'sheerun/vim-polyglot'
"Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch/'
Plug 'ludovicchabant/vim-gutentags'
Plug 'universal-ctags/ctags'
Plug 'vimwiki/vimwiki/'
Plug 'lambdalisue/suda.vim/'
Plug 'vim-scripts/calendar.vim--Matsumoto'
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'arcticicestudio/nord-vim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'puremourning/vimspector'
"Plug 'szw/vim-maximizer'
Plug 'itchyny/lightline.vim'
Plug 'szw/vim-maximizer'
"Plug 'dahu/Nexus'
Plug 'jesseleite/vim-agriculture'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SpellCheck'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdtree'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'akinsho/toggleterm.nvim'
Plug 'jparise/vim-graphql'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'SirVer/ultisnips'
Plug 'ahmedkhalf/project.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'unblevable/quick-scope'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ryanoasis/vim-devicons'
Plug 'abecodes/tabout.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'kdheepak/tabline.nvim'
Plug 'ton/vim-bufsurf'
Plug 'wellle/targets.vim'
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:markdown_folding=1

set completeopt=menu,menuone,noselect

hi TabLine    gui=NONE guibg=#000000 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white

set linebreak
set number
set showbreak=+++
set showmatch
set visualbell
set vb t_vb=

set hlsearch
set smartcase
set ignorecase
set incsearch
 
set tabstop=4
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set autochdir

set ruler
 
set undolevels=1000
set backspace=indent,eol,start

set nobackup
set nowritebackup
set fileencoding=utf8
set encoding=UTF-8

syntax on

inoremap jk <esc>
vnoremap J 5j
vnoremap K 5k

nnoremap <leader>J J
nnoremap J 5j
nnoremap K 5k

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap Y y$

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap D \"_d
"nmap gd yiw/function<space><c-r>0<CR>

set clipboard+=unnamedplus

nmap <C-p> :terminal {start C:\Users\ELLE\Desktop\Shane\music\elle_1.ly}
map <space> <leader>nnoremap <leader>tn :tabnew<CR>

nnoremap <A-,> :bprevious<CR>
nnoremap <A-.> :bnext<CR>
nmap <A-l> :call vimspector#StepInto()<CR>
nmap <A-k> :call vimspector#StepOut()<CR>
nmap <A-j> :call vimspector#StepOver()<CR>
nmap <A-h> :call vimspector#Continue()<CR>

nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>to :tabo<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>: @:
nnoremap <leader>@ @@
nnoremap <leader>[ [{
nnoremap <leader>] ]}
nnoremap <leader>j J
nnoremap <leader>uu :MundoToggle<CR>
nnoremap <leader>sm :marks<CR>
nnoremap <leader>sb :ls<CR>:b<space>
nmap <leader>/ <Plug>AgRawSearch
nnoremap <leader>zc :HopChar2<CR>
nnoremap <leader>zf :Files ~<CR>
nnoremap <leader>zb :Buffers<CR>
nnoremap <leader>zt :BTags<CR>
nnoremap <leader>zw :Windows<CR>
nnoremap <leader>zh :History<CR>
nnoremap <leader>zg :BCommits<CR>
nnoremap <leader>zm :Maps<CR>
"nnoremap <leader>gs :G<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Git commit -m 
nnoremap <leader>gp :Git push<CR>
"nnoremap <leader>gg :terminal git pull
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pa :ASOn<CR>
nnoremap <leader>pA :ASOff<CR>
nnoremap <leader>ia gg=G

nnoremap <leader>cj :Cheat js <CR>
nnoremap <leader>cs :Cheat <CR>

"nnoremap <leader>ol :e C:\Users\ELLE\Desktop\Shane\music\elle_1.ly<CR>
nnoremap <leader>ob :e C:\Users\ELLE\Desktop\Shane\vs_code\i_bet_you_wont\src\App.js<CR>
nnoremap <leader>ov :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>oe :e ~/.eslintrc.json<CR>
nnoremap <leader>od :e ~/personal/psyche/.vimspector.json<CR>
nnoremap <leader>oc :e ~/.viebrc<CR>
nnoremap <leader>ow :e ~/.local/share/nvim/plugged/vimwiki/ftplugin/vimwiki.vim<CR>
nnoremap <leader>on :e ~/.config/neofetch/config.conf<CR>
"nnoremap <leader>onl :e ~/.config/nvim/plug-config/lsp-config.vim<CR>
"nnoremap <leader>oa :e ~/.config/alacritty/alacritty.yml<CR>
nnoremap <leader>or :e C:\Users\ELLE\Desktop\Shane\projects\rs_challenge_dev\<CR>
nnoremap <leader>oa :e C:\Users\ELLE\Desktop\Shane\projects\dev_agency\<CR>
nnoremap <leader>oe :e C:\Users\ELLE\Desktop\Shane\projects\elle_progress\<CR>
nnoremap <leader>op :e C:\Users\ELLE\Desktop\Shane\projects\progress\<CR>
nnoremap <leader>ot :e C:\Users\ELLE\Desktop\Shane\projects\test\src\App.js<CR>
nnoremap <leader>ou :e C:\Users\ELLE\AppData\Local\nvim\snippets\<CR>
"nnoremap <leader>opo :e ~/polybar-collection/themes/nord/<CR>
"nnoremap <leader>opj :e ~/personal/psyche/script.js<CR>
"nnoremap <leader>oeih :e C:\Users\TheNo\Desktop\Shane\vs_code\elle_progress\index.html<CR>
"nnoremap <leader>oeij :e C:\Users\TheNo\Desktop\Shane\vs_code\elle_progress\index.js<CR>
"nnoremap <leader>oeic :e C:\Users\TheNo\Desktop\Shane\vs_code\elle_progress\index.css<CR>
"nnoremap <leader>oeuh :e C:\Users\TheNo\Desktop\Shane\vs_code\elle_progress\update.html<CR>
"nnoremap <leader>oeuj :e C:\Users\TheNo\Desktop\Shane\vs_code\elle_progress\update.js<CR>
"nnoremap <leader>oph :e ~/personal/psyche/index.html<CR>
"nnoremap <leader>opc :e ~/personal/psyche/styles.css<CR>
"nnoremap <leader>or :e ~/.config/ranger/rc.conf<CR>
"nnoremap <leader>oc :e ~/.config/nvim/coc-settings.json<CR>
"nnoremap <leader>od :e ~/.vim/bin/generate-vimwiki-diary-template<CR>
nnoremap <Leader>ms :SudaWrite<CR>
nnoremap <Leader>mw :w!<CR>
nnoremap <Leader>ma :w 
nnoremap <Leader>md :call delete(expand('%'))<CR>
nnoremap <Leader>mc :wqa<CR>
nnoremap <Leader>mq :q<CR>
nnoremap <Leader>mx :q!<CR>
nnoremap <leader>mr :Rename! 
nmap <Leader>mm :MaximizerToggle!<CR>
nmap <Leader>mn :e %:h/
nnoremap <Leader>bb :split<CR>
nnoremap <Leader>bv :vsplit<CR>
nnoremap <Leader>bx :bd!<CR>
nnoremap <leader>bd :%bd!<CR>
nnoremap <leader>be <C-w>=<CR>
nnoremap <leader>bn :sp new<CR>
nnoremap <leader>bo <c-w>o<CR>
nnoremap <leader>bh <c-w>H<CR>
nnoremap <leader>bj <c-w>J<CR>
nnoremap <leader>bk <c-w>K<CR>
nnoremap <leader>bl <c-w>L<CR>
nnoremap <leader>th :nohlsearch<CR>
nnoremap <leader>j :VimwikiFollowLink<CR>
nnoremap <leader>k :VimwikiGoBackLink<CR>
"nmap <leader>wj :VimwikiFollowLink<CR>
"nmap <leader>wk :VimwikiGoBackLink<CR>
nmap <leader>ww :VimwikiIndex<CR>
"nmap <leader>wc :VimwikiIndex<CR><leader>wc<A-l><C-l>
nmap <leader>wl <Plug>VimwikiIncrementListItem
nmap <leader>wh <Plug>VimwikiDecrementListItem
nmap <leader>wd <Plug>VimwikiDeleteFile
nmap <leader>wn <Plug>VimwikiMakeDiaryNote
nmap <leader>wg <Plug>VimwikiDiaryGenerateLinks
nmap <leader>wy <Plug>VimwikiMakeYesterdayDiaryNote<CR>
nmap <leader>wt <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>w, <Plug>VimwikiDiaryPrevDay
nmap <leader>w. <Plug>VimwikiDiaryNextDay
nmap <leader>wc :Calendar<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"nmap <leader>us :UltiSnipsEdit!<CR>

"map <CS-J> 5<C-e>
"map <CS-K> 5<C-y>
nnoremap <C-S-h> :vertical resize -5<CR>
nnoremap <C-S-l> :vertical resize +5<CR>
nnoremap <C-S-j> :resize -5<CR>
nnoremap <C-S-k> :resize +5<CR>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gf <C-]><CR>
nmap <silent> gb <C-^><CR>
"nnoremap <silent> rc :!ctags -R<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Leader>de :VimspectorEval<CR>
"nmap <Leader>dw :VimspectorWatch<CR>
nmap <Leader>do :VimspectorShowOutput<CR>
nnoremap <Leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <Leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <Leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <Leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <Leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <Leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dR :call vimspector#Restart()<CR>
nnoremap <Leader>dg :call vimspector#RunToCursor()<CR>
nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dp <Plug>VimspectorPause
nnoremap <Leader>dfb <Plug>VimspectorAddFunctionBreakpoint
nnoremap <Leader>dcb <Plug>VimspectorToggleConditionalBreakpoint
nnoremap <Leader>dx :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>ds :call vimspector#Stop()<CR>

nnoremap <leader>rx :%s/XXX/
"nnoremap <leader>ri :Nexus 1 1 | %s/X/\=Nexus()/
nnoremap <leader>ri :%s/X/\=Incr()<CR>

nnoremap <Leader>nt :NERDTree<CR>
nnoremap <Leader>tt :ToggleTerm size=10 direction=horizontal<CR>
nnoremap <Leader>t1 :1ToggleTerm size=10 direction=horizontal<CR>
nnoremap <Leader>t2 :2ToggleTerm size=10<CR>
nnoremap <Leader>t3 :3ToggleTerm size=10<CR> 
nnoremap <Leader>t4 :4ToggleTerm size=10<CR>
nnoremap <Leader>t5 :5ToggleTerm size=40<CR> 

nnoremap <Leader>li :LspInfo<CR>

nnoremap <Leader>cgs :TermExec cmd="sh C://Users//Elle//Desktop//shane//projects//song_plug//sh//get_songs.sh" dir=~/<my-repo-path><CR>
nnoremap <Leader>cga :TermExec cmd="sh C://Users//Elle//Desktop//shane//projects//song_plug//sh//get_songs.sh" dir=~/<my-repo-path><CR>
nnoremap <Leader>cps :TermExec cmd="sh C://Users//Elle//Desktop//shane//projects//song_plug//sh//post_song.sh" dir=~/<my-repo-path><CR>

map <F5> :setlocal spell!<CR>

lua << EOF
vim.keymap.set(
  'n', 
  '<leader>cc', -- e.g. '<leader>c`
  function()
    vim.cmd('term curl ' .. vim.fn.getreg('+'):gsub('\n', ''))
  end, 
  {}
)
EOF

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)

nnoremap <leader>gr :RgRoot<CR>
nnoremap <leader>gs :Rg 
nnoremap <leader>sr :%s/

let NERDTreeShowHidden=1

set undofile
set undodir=~/.vim/undo
set autochdir

set bg=dark
set termguicolors
set number
set relativenumber
set hidden
set autowriteall

set guifont=Hack:h12
"set statusline+=%o

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#9D00FF' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#9D00FF' gui=underline ctermfg=81 cterm=underline
augroup END
nmap <leader>qs <plug>(QuickScopeToggle)
xmap <leader>qs <plug>(QuickScopeToggle)

set noswapfile
colorscheme nord

autocmd FileChangedRO * echohl WarningMsg | echo "" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "" | echohl None
autocmd CursorMoved * set nohlsearch
nnoremap n n:set hlsearch<CR>

let b:n = 0
function! Incr()
	let b:n = b:n + 1
	return b:n
endfunction

autocmd QuickFixCmdPost *grep* cwindow

"Spelling
let loaded_spellfile_plugin = 1
hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').html.setup{}
lua require('lspconfig').jsonls.setup{}
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').sumneko_lua.setup{}
lua require('lspconfig').vimls.setup{}
lua require('lspconfig').yamlls.setup{}
lua require('lua_config')
lua require("toggleterm").setup{}

nnoremap <silent> <c-d> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-a> <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <c-z> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <c-x> <cmd>lua vim.diagnostic.goto_next()<CR>
lua <<EOF
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
       { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['cssls'].setup {
    capabilities = capabilities
  }

  require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  -- LuaSnips

require("luasnip/loaders/from_vscode").lazy_load()
EOF
