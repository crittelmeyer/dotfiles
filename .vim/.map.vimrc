" Quickly edit/reload the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>:echo "RELOADED!"<CR>

" clear out a search by pressing <Leader><Space>
nnoremap <Leader><Space> :noh<CR>

" remap % to <Tab> since it's so useful when coding
nnoremap <Tab> %
vnoremap <Tab> %

" readline style <Home> binding in vim command line
cnoremap <C-a> <Home>

" when navigating wrapped rows, don't "jump" over wrapped lines
nnoremap j gj
nnoremap k gk

" quick split w prev buffer
map <Leader>vb :vert sb 1<CR>

" forget to sudo? just w!!
cmap w!! w !sudo tee % >/dev/null

" toggle line number mode with F3
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F3> :call NumberToggle()<CR>

" a shortcut for inserting blank lines without entering insert mode

nmap <C-Enter> O<Esc>j

" reselect recently pasted text (for applying indentation, etc)
nnoremap <Leader>v V`]

" Custom insert mode mappings
" .log suffix adds console.log surrounding function
" autocmd FileType javascript imap .log<Tab> <Esc>^iconsole.log(<Esc>A;
" since I have the autopair plugin installed, the above command doesn't work. instead:
" autocmd FileType javascript imap .log<Tab> <Esc>^iconsole.log(<Esc>lxA);

" shortcut for escaping to normal mode
inoremap jj <ESC>
inoremap jjj <ESC>:w<CR> 

" don't lose selection when indenting visual block
xnoremap <  <gv
xnoremap >  >gv

" magic regex - make vim regex more like perl/python regex
nnoremap / /\v
vnoremap / /\v

" exit help with just q
autocmd FileType help nnoremap <silent><buffer> q :q<CR>

" shortcuts for switching vim window focus
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" Shift-Enter adds blank line below current line
nnoremap <silent><S-CR> :set paste<CR>m`o<Esc>``:set nopaste<CR>`
" Ctrl-Enter adds blank line above current line
nnoremap <silent><C-CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Ctrl-Space performs undo
map <C-Space> :u<CR> 

" Ctrl-C copies selection to mac clipboard
vnoremap <C-c> :w !pbcopy<CR>

" Shortcut for hiding syntastic
nmap <Leader>syn :SyntasticReset<CR>
nmap <Leader>syy :SyntasticReset<CR>
