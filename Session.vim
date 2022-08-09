let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/AppData/Local/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +5 ~/Dropbox/Vimwiki/Wiki.md
badd +265 ~/Dropbox/Vimwiki/job_applications.md
badd +7 ~/Dropbox/Vimwiki/elle.md
badd +4 ~/Dropbox/Vimwiki/business_ideas.md
badd +1 ~/Dropbox/Vimwiki/beani.md
badd +1 ~/Dropbox/Vimwiki/ellephant_organix.md
badd +1 ~/Dropbox/Vimwiki/ellephant_organix_recipes.md
badd +1 ~/Desktop/Shane/projects/dev_agency/pages/_app.js
badd +25 ~/Desktop/Shane/projects/dev_agency/pages/contact.jsx
badd +194 init.vim
badd +1805 ~/.local/share/nvim/plugged/vim-snippets/ultisnips/all.snippets
badd +8 ~/Desktop/Shane/projects/dev_agency/pages/api/sendgrid.js
badd +1 ~/Desktop/Shane/projects/dev_agency/next.config.js
badd +1 ~/Desktop/Shane/projects/dev_agency/.env
badd +32 ~/Desktop/Shane/projects/dev_agency/pages/api/mailgun.js
badd +1 ~/Dropbox/Vimwiki/coding.md
argglobal
%argdel
edit init.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 31 + 22) / 45)
exe '2resize ' . ((&lines * 11 + 22) / 45)
argglobal
balt ~/Dropbox/Vimwiki/coding.md
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 329 - ((15 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 329
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("term://~/Desktop/Shane/projects/dev_agency//17960:cmd.exe&::toggleterm::1", ":p")) | buffer term://~/Desktop/Shane/projects/dev_agency//17960:cmd.exe&::toggleterm::1 | else | edit term://~/Desktop/Shane/projects/dev_agency//17960:cmd.exe&::toggleterm::1 | endif
if &buftype ==# 'terminal'
  silent file term://~/Desktop/Shane/projects/dev_agency//17960:cmd.exe&::toggleterm::1
endif
balt ~/Desktop/Shane/projects/dev_agency/pages/contact.jsx
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 1022 - ((10 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1022
normal! 0
wincmd w
exe '1resize ' . ((&lines * 31 + 22) / 45)
exe '2resize ' . ((&lines * 11 + 22) / 45)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
