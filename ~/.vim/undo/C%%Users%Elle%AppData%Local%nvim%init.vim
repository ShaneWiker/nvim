Vim�UnDo� !�3o�������s���|�����   �   lua require('keymaps')   �         1       1   1   1    b�Xm    _�                             ����    A                                                                                                                                                          �                                                                                                          �          �                                              	           V        b�W2     �                "Plug 'sheerun/vim-polyglot'   "Plug 'dense-analysis/ale'   0"Plug 'neoclide/coc.nvim', {'branch': 'release'}   4"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   "Plug 'junegunn/fzf.vim'5��                          �       �               5�_�                            ����    <                                                                                                                                                          �                                                                                                          �          �                                                         V        b�W4     �                "Plug 'szw/vim-maximizer'5��                          d                     5�_�                            ����    ;                                                                                                                                                          �                                                                                                          �          �                                                         V        b�W5     �                "Plug 'dahu/Nexus'5��                          �                     5�_�                    &        ����    :                                                                                                                                                          �                                                                                                          �          �                                                         V        b�W7    �   %   &          "Plug 'SirVer/ultisnips'5��    %                      l                     5�_�                    �        ����    9                                                                                                                                                          �                                                                                                          �          �                                                         V        b�WC     �   �   �          set vb t_vb=5��    �                      �                     5�_�                    �        ����    9                                                                                                                                                          �                                                                                                          �          �                                                         V        b�WC     �   �   �   �           �   �   �   �       5��    �                      �                     5�_�                    �        ����    9                                                                                                                                                          �                                                                                                          �          �                                                         V        b�WE     �   �   �   �    �   �   �   �    5��    �                      �                     5�_�      	              �        ����    9                                                                                                                                                          �                                                                                                          �          �                                                         V        b�WG     �   �   �          " auto-format5��    �                      �                     5�_�      
           	   �        ����    9                                                                                                                                                          �                                                                                                          �          �                                                         V        b�WL     �   �   �          	"Spelling5��    �                      1      
               5�_�   	              
   �        ����    9                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�WN     �   �   �          set vb t_vb=   set noswapfile   colorscheme nord5��    �                      �      -               5�_�   
                 �        ����    9                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�WO     �   �   �   �           �   �   �   �       5��    �                      �                     5�_�                    F        ����    9                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�WW     �   F   J   �    �   F   G   �    5��    F                      &              -       5�_�                    I        ����    9                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�WX     �   I   K   �    5��    I                      S                     5�_�                    G        ����    9                                                                                                                                                          �                                                                                                          �          �                                   G           I           V        b�WZ     �   F   G          set vb t_vb=   set noswapfile   colorscheme nord5��    F                      &      -               5�_�                    8        ����    9                                                                                                                                                          �                                                                                                          �          �                                   G           G           V        b�W\     �   8   :   �    5��    8                      z                     5�_�                    9        ����    :                                                                                                                                                          �                                                                                                          �          �                                   H           H           V        b�W]     �   9   =   �    �   9   :   �    5��    9                      {              -       5�_�                    9        ����    =                                                                                                                                                          �                                                                                                          �          �                                   K           K           V        b�W]     �   8   9           5��    8                      z                     5�_�                    :        ����    <                                                                                                                                                          �                                                                                                          �          �                                   J           J           V        b�W^     �   :   <   �    5��    :                      �                     5�_�                    <        ����    =                                                                                                                                                          �                                                                                                          �          �                                   K           K           V        b�W`     �   <   >   �    5��    <                      �                     5�_�                    L        ����    >                                                                                                                                                          �                                                                                                          �          �                                   L           L           V        b�Wc     �   K   L           5��    K                      U                     5�_�                    �        ����    >                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�Wt     �   �   �          fhi TabLine    gui=NONE guibg=#000000 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white       Cautocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)   Dautocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)   Cautocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)       augroup qs_colors   
  autocmd!   m  autocmd ColorScheme * highlight QuickScopePrimary guifg='#9D00FF' gui=underline ctermfg=155 cterm=underline   n  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#9D00FF' gui=underline ctermfg=81 cterm=underline   augroup END5��    �                      �      <              5�_�                    =        ����    >                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�Wz     �   =   I   �    �   =   >   �    5��    =                      �              <      5�_�                    D        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�W|    �   D   F   �    5��    D                      �                     �    D                      �                     �    D                      �                     5�_�                    E        ����    J                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�W     �   D   E           5��    D                      �                     5�_�                   �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�W�     �   �   �          &autocmd QuickFixCmdPost *grep* cwindow5��    �                      
      '               5�_�                    �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�W�     �   �   �   �    �   �   �   �    5��    �                      �              '       5�_�                    �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �          �          V       b�W�     �   �   �          let loaded_spellfile_plugin = 1   6hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f   8hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f   7hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f   6hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f5��    �                      2      �               5�_�                    �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �          �          V       b�W�     �   �   �   �    �   �   �   �    5��    �                      1              �       5�_�                    �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �          �          V       b�W�     �   �   �          2" Customize fzf colors to match your color scheme.5��    �                      2      3               5�_�                     �        ����    I                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �           5��    �                      1                     5�_�      !               �       ����    I                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �   �      (nmap <leader>qs <plug>(QuickScopeToggle)5��    �                     �      )       L       5�_�       "           !   �       ����    I                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �   �      (xmap <leader>qs <plug>(QuickScopeToggle)5��    �                           )       L       5�_�   !   #           "   �        ����    I                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �          Kvim.api.nvim_set_keymap("n", "<leader>qs", "<plug>(QuickScopeToggle)", { })   Kvim.api.nvim_set_keymap("x", "<leader>qs", "<plug>(QuickScopeToggle)", { })5��    �                      �      �               5�_�   "   $           #   �        ����    I                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�    �   �   �   �           �   �   �   �       5��    �                      �                     5�_�   #   %           $   �        ����    I                                                                                                                                                                                                                                                                     �          �                                   �           �           V        b�W�     �   �   �          Aautocmd FileChangedRO * echohl WarningMsg | echo "" | echohl None   Dautocmd FileChangedShell * echohl WarningMsg | echo "" | echohl None   $autocmd CursorMoved * set nohlsearch   &autocmd QuickFixCmdPost *grep* cwindow    5��    �                      �      �               5�_�   $   &           %   C        ����    I                                                                                                                                                                                                                                                                     �          �                                   �           �           V        b�W�     �   C   I   �    �   C   D   �    5��    C                      �              �       5�_�   %   '           &   C        ����    N                                                                                                                                                                                                                                                                     �          �                                   �           �           V        b�W�    �   B   C           5��    B                      �                     5�_�   &   (           '   �        ����    M                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �          let loaded_spellfile_plugin = 1   6hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f   8hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f   7hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f   6hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f5��    �                      �      �               5�_�   '   )           (   �        ����    M                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   �   �   �           �   �   �   �       5��    �                      �                     5�_�   (   *           )   L        ����    M                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   L   N   �    5��    L                      �	                     5�_�   )   +           *   M        ����    N                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   M   S   �    �   M   N   �    5��    M                      �	              �       5�_�   *   ,           +   R        ����    S                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�    �   R   T   �    5��    R                      �
                     5�_�   +   -           ,   O       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   N   P   �      6hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f5��    N                     �	                     5�_�   ,   .           -   P       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   O   Q   �      8hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f5��    O                     -
                     5�_�   -   /           .   Q       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�     �   P   R   �      7hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f5��    P                     d
                     5�_�   .   0           /   R       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�W�    �   Q   S   �      6hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f5��    Q                     �
                     5�_�   /   1           0   �       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          V       b�Xj     �   �            �   �            5��    �                      �                     5�_�   0               1   �       ����    T                                                                                                                                                                                                                                                                     �          �                                   �          �          v       b�Xl    �   �              lua require('keymaps')5��    �                    �                    5�_�                    �        ����    I                                                                                                                                                          �                                                                                                          �          �                                   �           �           V        b�W�     �   �   �        5��    �                      �                     5��