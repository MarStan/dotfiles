set nocompatible

filetype off  "обязательно!
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

:colorscheme solarized
:set background=dark

Plugin 'VundleVim/Vundle.vim'          " Vundle, the plug-in manager for Vim
Plugin 'Shougo/vimproc.vim'            " Interactive command execution in Vim.
Plugin 'tpope/vim-sensible'            " sensible.vim: Defaults everyone can agree on
Plugin 'tpope/vim-surround'            " surround.vim: quoting/parenthesizing made simple
Plugin 'scrooloose/syntastic'          " Syntax checking hacks for vim
Plugin 'scrooloose/nerdtree'           " A tree explorer plugin for vim.
Plugin 'tpope/vim-commentary'          " commentary.vim: comment stuff out
Plugin 'tpope/vim-repeat'              " repeat.vim: enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-unimpaired'          " unimpaired.vim: pairs of handy bracket mappings
Plugin 'ctrlpvim/ctrlp.vim'            " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'bling/vim-airline'             " lean & mean status/tabline for vim that's light as air
Plugin 'majutsushi/tagbar'             " Vim plugin that displays tags in a window, ordered by scope
Plugin 'godlygeek/tabular'             " Vim script for text filtering and alignment
Plugin 'mbbill/undotree'               " The ultimate undo history visualizer for VIM
Plugin '2072/PHP-Indenting-for-VIm'    " The official VIm indent script for PHP
Plugin 'ervandew/supertab'             " Perform all your vim insert mode completions with Tab
Plugin 'Valloric/MatchTagAlways'       " A Vim plugin that always highlights the enclosing html/xml tags
Plugin 'jeetsukumaran/vim-buffergator' " Vim plugin to list, select and switch between buffers.
Plugin 'nathanaelkane/vim-indent-guides' " Vim plugin to display idention level with the vertical lines
Plugin 'pangloss/vim-javascript' " JavaScript bundle for vim, this bundle provides syntax and indent plugins.
Plugin 'heavenshell/vim-jsdoc'
Plugin 'digitaltoad/vim-jade'
Plugin 'kovisoft/slimv'                "Superior Lisp Interaction Mode for Vim ('SLIME for Vim')

call vundle#end()
syntax on
filetype on
filetype plugin indent on
filetype plugin on

let mapleader=","

" confirm to close buffer
set confirm

" message language
:language en_US.utf8

" Sets how many lines of history VIM has to remember
 set history=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" enhanced command completion
set wildmenu

set visualbell

set cursorline
set hidden
set nofoldenable

set nowrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set wrap
set linebreak
set nolist
set showbreak=+++
autocmd FileType javascript set tabstop=2|set shiftwidth=2
" bug in vudle wich destraoy highlt in jade files
autocmd BufNewFile,BufRead *.jade set filetype=jade
" higlight anything over 80 chars with red
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.*/

:let g:easytags_cmd = '/usr/bin/ctags-exuberant'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:easytags_async = 1
let g:easytags_on_cursorhold = 1

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1


let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_haml_checkers = ['haml_lint']
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" let g:syntastic_erlang_checkers = ['syntaxerl']

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_exec='~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

set list  "включить подсветку табов и пробелов в конце и начале строки
set listchars=tab:·\ ,trail:·  "символы которыми будет осуществлються подсветка

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

autocmd FileType c,cpp,php setlocal commentstring=//\ %s

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=DarkBlue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=DarkGreen
