" use Vim settings, rather then Vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" don't close buffers, just hide them
set hidden

" remember more commands and search history
set history=1000

" use many muchos levels of undo
set undolevels=1000

" always show vim-airline status bar
set laststatus=2

" set color scheme and enable syntax highlighting
set t_Co=256
colorscheme grb4
syntax on

" show incomplete cmds down the bottom
set showcmd 

" show line numbers
set number

" use vertical splits when comparing files w vimdiff
set diffopt+=vertical

" use softtabstop spaces instead of tab characters
set expandtab

" indent by 2 spaces when using >>, <<, == etc.
" indent by 2 spaces when pressing <TAB>
set shiftwidth=2
set softtabstop=2

" keep indentation from previous line
set autoindent

" if searching all lcase, case insensitive
" if searching with some ucase, case sensitive
set ignorecase
set smartcase

" enable global searches by default
set gdefault

" highlight search results as you type
set incsearch
set showmatch
set hlsearch

" handle long lines correctly
set wrap
set textwidth=109
set colorcolumn=110

" highlighting for current line - better readability
set cursorline

" tab completion for command line commands
set wildmenu
set wildmode=longest:full,full

" toggle paste mode with F2
set pastetoggle=<F2>

" default relative line numbers on
set relativenumber

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" sane timeout settings - don't need to wait an entire second for key codes
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

" turn on matchit macro for navigating open/close
" structs i.e. html tags
" extends % command - press % while inside a tag to go to matching tag
runtime macros/matchit.vim
filetype plugin on

" I like , to be my <Leader>, but I also find its default function
" useful, so I've moved it to ; and moved ; to \ (where <Leader>
" used to be). This maintains the physical left-and-right control
" that , and ; offered previously for finding prev/next
noremap ; ,
noremap \ ;

" explicitly set <Leader>
let mapleader=","

" go back to previous cursor position when reopening a file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" always save when editor window loses focus
autocmd FocusLost * :wa

" change cursor style when in insert mode
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" custom key mappings
source ~/.vim/.map.vimrc

" Plugins

" install pathogen plugins
execute pathogen#infect()

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = "--ignore=E101,E223,E224,E301,E302,E303,E501,E701,W,F401,E111,E261"

let g:syntastic_javascript_checkers = ['eslint']
" augroup syntastic_javascript_jsx
"   autocmd!
"   autocmd BufReadPre,BufNewFile *.js 
"   autocmd BufReadPre,BufNewFile *.jsx
"         \ let g:syntastic_javascript_checkers = ['jsxhint']
" augroup END

let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_html_checkers = []
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_checkers = ['scss_lint']

" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Rails projections {{{

if !exists('g:rails_projections')
  let g:rails_projections = {}
endif

call extend(g:rails_projections, {
      \ "config/routes.rb": { "command": "routes" },
      \ "config/structure.sql": { "command": "structure" }
      \ }, 'keep')

if !exists('g:rails_gem_projections')
  let g:rails_gem_projections = {}
endif

call extend(g:rails_gem_projections, {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "template": "class %SSerializer < ActiveModel::Serializer\nend",
      \     "affinity": "model"}},
      \ "react-rails": {
      \   "app/assets/javascripts/components/*.jsx": {
      \     "command": "component",
      \     "template": "var %S = window.%S = React.createClass({\n  render: function() {\n  }\n});",
      \     "alternate": "spec/javascripts/components/%s_spec.jsx" }},
      \ "rspec": {
      \    "spec/**/support/*.rb": {
      \      "command": "support"}},
      \ "cucumber": {
      \   "features/*.feature": {
      \     "command": "feature",
      \     "template": "Feature: %h"},
      \   "features/support/*.rb": {
      \     "command": "support"},
      \   "features/support/env.rb": {
      \     "command": "support"},
      \   "features/step_definitions/*_steps.rb": {
      \     "command": "steps"}},
      \ "carrierwave": {
      \   "app/uploaders/*_uploader.rb": {
      \     "command": "uploader",
      \     "template": "class %SUploader < CarrierWave::Uploader::Base\nend"}},
      \ "draper": {
      \   "app/decorators/*_decorator.rb": {
      \     "command": "decorator",
      \     "affinity": "model",
      \     "template": "class %SDecorator < ApplicationDecorator\nend"}},
      \ "fabrication": {
      \   "spec/fabricators/*_fabricator.rb": {
      \     "command": ["fabricator", "factory"],
      \     "alternate": "app/models/%s.rb",
      \     "related": "db/schema.rb#%p",
      \     "test": "spec/models/%s_spec.rb",
      \     "template": "Fabricator :%s do\nend",
      \     "affinity": "model"}},
      \ "factory_girl": {
      \   "spec/factories/*.rb": {
      \     "command": "factory",
      \     "alternate": "app/models/%i.rb",
      \     "related": "db/structure.sql#%s",
      \     "test": "spec/models/%s_spec.rb",
      \     "template": "FactoryGirl.define do\n  factory :%i do\n  end\nend",
      \     "affinity": "model"},
      \   "spec/factories.rb": {
      \      "command": "factory"},
      \   "test/factories.rb": {
      \      "command": "factory"}}
      \ }, 'keep')
" }}}

" Dispatch settings
autocmd FileType ruby
  \ let b:start = executable('pry') ? 'pry -r "%:p"' : 'irb -r "%:p"' |
  \ if expand('%') =~# '_test\.rb$' |
  \   let b:dispatch = 'testrb %' |
  \ elseif expand('%') =~# '_spec\.rb$' |
  \   let b:dispatch = 'rspec %' |
  \ elseif !exists('b:dispatch') |
  \   let b:dispatch = 'ruby -wc %' |
  \ endif

" custom plugin key mappings
source ~/.vim/.plugin_map.vimrc
