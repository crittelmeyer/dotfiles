" custom mappings for vim plugins
" Use a leader instead of the actual named binding
nmap <Leader>p :CtrlP<CR>

" Easy bindings for its various modes
nmap <Leader>bb :CtrlPBuffer<CR>
nmap <Leader>bm :CtrlPMixed<CR>
nmap <Leader>bs :CtrlPMRU<CR>

" show function list for current file
nnoremap <Leader>fu :CtrlPFunky<CR>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>

" map Leader-n to toggle the nerd tree plugin
map <Leader>n :NERDTreeToggle<CR>

" mappings for vim-rails to quickly open related files
map <Leader>Rm :Emodel<CR>
map <Leader>Rv :Eview<CR>
map <Leader>Rc :Econtroller<CR>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Go to the previous buffer open
nmap <Leader>jj :BuffergatorMruCyclePrev<CR>

" Go to the next buffer open
nmap <Leader>kk :BuffergatorMruCycleNext<CR>

" View the entire list of buffers open
nmap <Leader>bl :BuffergatorOpen<CR>

" Open a new empty buffer
nmap <Leader>T :enew<CR>

" Close the current buffer and move to the previous one
nmap <Leader>bq :bp <BAR> bd #<CR>

" Change vim-move modifier to Ctrl
let g:move_key_modifier = 'C'

" Shortcuts for manipulating gists
nmap <Leader>gl :Gist -l<CR>
nmap <Leader>gp :Gist -p<CR>
nmap <Leader>gP :Gist -P<CR>

" do Ack search
nmap <Leader>A :Ack<Space>

" Shortcut for :Dispatch
nmap <Leader>t :Dispatch<CR>

" Shortcuts for fugitive
nmap <Leader>gst :Gstatus<CR>
nmap <Leader>gaa :Git add .<CR>:Gstatus<CR>
nmap <Leader>grbi :Git rebase -i<CR>
nmap <Leader>grbc :Git rebase --continue<CR>
nmap <Leader>hub :Gbrowse<CR>
