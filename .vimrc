set nocompatible
filetype off  "обязательно!
filetype plugin indent on     " обязательно!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()



"репозитории на github
"менеджер модулей
Bundle 'gmarik/vundle'
"проверка синтаксиса
Bundle 'scrooloose/syntastic'
"автодополнение
Bundle 'Valloric/YouCompleteMe'
"автодополнение nodejs
Bundle 'marijnh/tern_for_vim'
"дерево каталогов
Bundle 'scrooloose/nerdtree'
"автокоментирование
Bundle 'scrooloose/nerdcommenter'
"подсветка синтаксиса jade
Bundle 'digitaltoad/vim-jade'
"автозакрытие скобок
Bundle 'jiangmiao/auto-pairs'
"Snippets
Bundle 'SirVer/ultisnips'
"php Documentor
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'
"подсветка twig
Bundle 'evidens/vim-twig'
"let g:UltiSnipsExpandTrigger="<C-k>"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"репозитории vim/scripts
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"git репозитории (не на github)
"Bundle 'git://git.wincent.com/command-t.git'

set background=light
let g:solarized_termcolors=256
syntax on
colorscheme solarized
set t_Co=256

let g:AutoPairsFlyMode = 0
set cursorline " Подсветка строки, в которой находится в данный момент курсор
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
 set colorcolumn=80

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler

"set undolevels=1000
set backspace=indent,eol,start
set history=1000 " keep 1000 lines of command line history
set noswapfile
set nobackup " don't write backup file"
set hidden "hide buffers instead of closing them

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>
":nmap <C-e> :e#<CR>
:nmap <C-PageDown> :bn<CR>
:nmap <C-PageUp> :bp<CR>
:map <silent><f2> <esc>:w<Bar>:%s/\s\+$//e<Bar><CR>
:vmap <silent><f2> <esc>:w<Bar>:%s/\s\+$//e<Bar><CR>
:imap <silent><f2> <esc>:w<Bar>:%s/\s\+$//e<Bar><CR>

:map <f12> <esc>:NERDTreeToggle<CR>
:vmap <f12> <esc>:NERDTreeToggle<CR>
:imap <f12> <esc>:NERDTreeToggle<CR>

"настройка строки состояния
" fileformat - формат файла (unix, dos); fileencoding - кодировка файла;
" " encoding - кодировка терминала; TYPE - тип файла, затем коды символа под
" курсором;
" " позиция курсора (строка, символ в строке); процент прочитанного в файле;
" " кол-во строк в файле;
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ \ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"Включаем отображение вводимой информации в правом углу
set showcmd


"настройки отступов
set shiftwidth=4 "размер отступов при нажатии >> или <<
set tabstop=4  "ширина табуляции
set softtabstop=4  "ширина мягкого таба
set expandtab  "преобразование табуляции в пробелы
set cindent  "отступы в стиле СИ
"set smartindent  "умные автоотступы

set list  "включить подсветку табов и пробелов в конце и начале строки<F2>
set listchars=tab:·\ ,trail:·  "символы которыми будет осуществлються подсветка
" включаем подсветку выражения который мы ищем в тексте

"строки фиксированной длины
menu Textwidth.off :set textwidth=0<CR>
menu Textwidth.on :set textwidth=79<CR>

set pastetoggle=<f3>

" ============НАСТРОЙКА КЛАВИАТУРЫ И МЫШИ============
" Настраиваем переключение раскладок клавиатуры по <C-^>
set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
set iminsert=0
" аналогично для строки поиска и ввода команд
set imsearch=0

" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
    " Переключение раскладок будет производиться по <C-F>
    "
    " При английской раскладке статусная строка текущего окна будет синего
    " цвета, а при русской - зеленого.

    function MyKeyMapHighlight()
        if &iminsert == 0
            hi StatusLine ctermfg=Blue
        else
            hi StatusLine ctermfg=DarkRed
        endif
    endfunction

    " Вызываем функцию, чтобы она установила цвета при запуске Vim'a
    call MyKeyMapHighlight()

    " При изменении активного окна будет выполняться обновление
    " индикации текущей раскладки
    au WinEnter * :call MyKeyMapHighlight()

    cmap <silent> <C-f> <C-^>
    imap <silent> <C-f> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
    nmap <silent> <C-f> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
    vmap <silent> <C-f> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd BufRead,BufNewFile *.jade setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.js setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.jade setlocal ft=jade

"показываем всегда статусную строку
set laststatus=2
"по умолчанию черный цвет текста
hi statusline ctermbg=black
"меняем цвет текста в зависимости от мода{insert/normal}
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=white gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermbg=black gui=bold,reverse
endif

"syntastic recommended sttings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs']

"PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-h> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-h> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-h> :call PhpDocRange()<CR>
