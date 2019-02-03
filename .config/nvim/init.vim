"        ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVVVV/'+++++++++
"     +++|VVVVVVVVVVV/'+++++++++
"       +|VVVVVVVVV/'+++++++++
"        |VVVVVVV/'+++++++++
"        |VVVVV/'+++++++++
"        |VVV/'+++++++++
"        'V/'   ++++++
"                 ++

" Basic Settings
        let mapleader = " "
        filetype plugin on
        syntax on
        set termguicolors       " Requires 256 color terminal
        set encoding    =utf-8

        set expandtab
        set shiftwidth  =2
        set softtabstop =4

        set showtabline =2         " Always show tab bar
        set ignorecase
        set smartcase           " Ignore 'ignorecase' if pattern contains uppercase chars
        set noswapfile      " No swaps
        set nohlsearch      " Don't highlight search
        set number relativenumber

" Disable autocomment on newline
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Keybindings in russian layout
        set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

        set nrformats   =       " Treat all number as decimal, helps with <C-a> on number padded with zeros

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
        set splitbelow splitright

" Scrolling 5 lines before border
        set scrolloff   =5

" Don't show intro message
        set shortmess   =atI

        set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
        set wildignore+=*/bower_components/*,*/node_modules/*
        set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*

" Highlight whitespaces
        set list
        set listchars=""
        set listchars+=tab:>-
        set listchars+=trail:•
        set listchars+=nbsp:•

" Automatically delete all trailing whitespace on save
        autocmd BufWritePre * %s/\s\+$//e


" Vim plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
call plug#end()

" Plugin settings

  " Lightline
  let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }
  set noshowmode

  " Gruvbox
  let g:gruvbox_italic = 1
  colorscheme gruvbox

  " NERDTree
  nmap <leader>n :NERDTreeToggle<CR>

  " fzf
  nmap <leader>f :FZF<CR>
  let g:fzf_colors = {
      \ 'fg':      ['fg', 'GruvboxGray'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'GruvboxRed'],
      \ 'fg+':     ['fg', 'GruvboxGreen'],
      \ 'bg+':     ['bg', 'GruvboxBg1'],
      \ 'hl+':     ['fg', 'GruvboxRed'],
      \ 'info':    ['fg', 'GruvboxOrange'],
      \ 'prompt':  ['fg', 'GruvboxBlue'],
      \ 'header':  ['fg', 'GruvboxBlue'],
      \ 'pointer': ['fg', 'Error'],
      \ 'marker':  ['fg', 'Error'],
      \ 'spinner': ['fg', 'Statement'],
      \ }

  " Vimwiki directories
  let g:vimwiki_list = [{'path': '~/notes/',
                       \ 'path_html': '~/notes/export/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

" Keyboard Mappings

" Copy selected text to system clipboard
  vnoremap <C-c> "+y
  map <C-p> "+P

  " emacs movement keybindings in insert mode
  imap <C-a> <C-o>0
  imap <C-e> <C-o>$
  map <C-e> $
  map <C-a> 0

  " sane movement with wrap turned on
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk

  " Better split movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Navigating with guides
  "inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
  "vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
  "map <leader><leader> <Esc>/<++><Enter>"_c4l
