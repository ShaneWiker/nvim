call plug#begin('~/.local/share/nvim/plugged')
Plug 'lewis6991/impatient.nvim'
Plug 'LionC/nest.nvim'
Plug 's1n7ax/nvim-terminal'
Plug 'simnalamburt/vim-mundo'
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
"Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/lsp-status.nvim'
"Plug 'puremourning/vimspector'
"Plug 'itchyny/lightline.vim'
Plug 'szw/vim-maximizer'
Plug 'jesseleite/vim-agriculture'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SpellCheck'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-treesitter/nvim-treesitter-refactor'
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'
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
Plug 'ahmedkhalf/project.nvim'
Plug 'jremmen/vim-ripgrep'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'unblevable/quick-scope'
Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ryanoasis/vim-devicons'
Plug 'abecodes/tabout.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'kdheepak/tabline.nvim'
Plug 'ton/vim-bufsurf'
Plug 'wellle/targets.vim'
Plug 'thugcee/nvim-map-to-lua'
Plug 'gennaro-tedesco/nvim-peekup'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'matze/vim-move'
"Plug 'mhinz/vim-startify'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'ahmedkhalf/lsp-rooter.nvim'
Plug 'romainl/vim-cool'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'karb94/neoscroll.nvim'
Plug 'weilbith/nvim-code-action-menu'
"Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'alvan/vim-closetag'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

"Taskwiki
"Plug 'tools-life/taskwiki'
"Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'majutsushi/tagbar'
"Plug 'plasticboy/vim-markdown'
"Plug 'xarthurx/taskwarrior.vim'

"Themes
Plug 'catppuccin/nvim'
call plug#end()

set vb t_vb=
"set noswapfile

hi TabLine    gui=NONE guibg=#000000 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd FileChangedRO * echohl WarningMsg | echo "" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "" | echohl None
"autocmd CursorMoved * set nohlsearch
autocmd QuickFixCmdPost *grep* cwindow

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=White guibg=Purple gui=underline ctermfg=White cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=White guibg=Purple gui=underline ctermfg=White cterm=underline
  "autocmd ColorScheme * highlight Search guifg='White' gui=underline ctermfg='#9D00FF' cterm=underline
augroup END

let loaded_spellfile_plugin = 1

"hi Cursor guifg=#121212 guibg=#afd700

if hostname() == 'LAPTOP-5C92PE9G'
let g:vimwiki_list = [{'path': 'C:/Users/ELLE/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki' }]
endif
if hostname() == 'amethyst'
let g:vimwiki_list = [{'path': '~/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki' }]
endif

if !has('gui_running')
	set t_Co=256
endif

let g:NERDTreeShowHidden = 1

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


    let g:startify_custom_header = [
            \ '                              ',
            \ '            __                ',
            \ '    __  __ /\_\    ___ ___    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/__/    \/_/\/_/\/_/\/_/',
            \ ]

lua require('config')
lua require('luasnips_config')
lua require('keymaps')
lua require('options')

nnoremap m/ :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap m. :lua require("harpoon.ui").nav_next()<CR>
nnoremap mm :lua require("harpoon.mark").add_file()<CR>
nnoremap m, :lua require("harpoon.ui").nav_prev()<CR>
nnoremap p "+p<CR>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascript.js': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let g:closetag_enable_react_fragment = 1

" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufRead * call SyncTree()
"
" " Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
