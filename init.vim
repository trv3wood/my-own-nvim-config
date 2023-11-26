" ---------------------------------------------------
" Plugins settings
" ---------------------------------------------------
call plug#begin('~/.vim/pluggjd')

Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \} 
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 

Plug 'scrooloose/nerdcommenter'
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
 
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/vim-terminal-help'

" ---- colorscheme Plugins----
Plug 'joshdick/onedark.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'tomasiser/vim-code-dark'
let g:codedark_term256=1
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()


" ----------------------------------------------
" basic settings
" ----------------------------------------------

filetype plugin on
" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double

set showmatch " 高亮匹配括号
set ignorecase
set softtabstop=4
set shiftwidth=4
set nu "设置显示行号
set expandtab
set autoindent "设置c语言自动对齐
" set mouse=a "设置可以在VIM使用鼠标
" set selectmode=mouse,key
set tabstop=4 "设置TAB宽度
set history=1000 "设置历史记录条数   

"共享剪切板
if version >= 603
     set helplang=cn
     set encoding=utf-8
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set updatetime=300
 
" autocmd FileType json syntax match Comment +\/\/.\+$+
 
set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠

set report=0 " tell which line changed in command line
 
" hi Normal ctermfg=252 ctermbg=none "背景透明
" au FileType gitcommit,gitrebase let g:gutentags_enabled=0
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




" -------------------------------------------------------
" key maps 
" -------------------------------------------------------

" some basic keymaps
inoremap jj <Esc> "将jj映射到Esc
nnoremap tr :NERDTree<CR> " 开启/关闭nerdtree快捷键
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz

" quik confirm configs 
noremap % :source %<CR>
" quik edit $VIMRC
noremap e% :e ~/.config/nvim/init.vim<CR>

"自动补全
inoremap ( ()<ESC>i

inoremap {<CR> {<CR>}<ESC>O

inoremap [ []<ESC>i

inoremap " ""<ESC>i

inoremap ' ''<ESC>i

inoremap /* /**/<Left><Left>

" 设置回车补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" split 视窗 using 'sp + h/j/k/l'
map spl :set splitright<CR>:vsplit<CR>
map sph :set nosplitright<CR>:vsplit<CR>
map spj :set splitbelow<CR>:split<CR>
map spk :set nosplitbelow<CR>:split<CR>

" move between 视窗
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" resize 视窗
nnoremap <A-V> :vertical resize+5 <CR> 
nnoremap <A-v> :vertical resize-5 <CR> 
nnoremap <A-.> :resize+5 <CR> 
nnoremap <A-,> :resize-5 <CR>

" 转置窗口，左右变上下，上下变左右
nnoremap sv <C-w>t<c-W>H
nnoremap sl <C-w>t<c-W>K

" C++ run & debug
map  <F5>  :w<CR>:call Run()<CR><A-j>i
imap <F5>  <ESC>:w<CR>:call Run()<CR><A-j>i
nnoremap  <F10> :w<CR>:call Debug()<CR><A-j>i
inoremap <F10> <ESC>:w<CR>:call Debug()<CR><A-j>i



" --------------------------------------------------------
" Vimscript
" --------------------------------------------------------


"下面是一个使用 Vimscript 编写的函数，该函数可以通过按下 F10 键来调试单个 C++ 文件：

function! Debug()
  let l:file = expand('%')
  let l:executable = substitute(l:file, '\.cpp$', '', '')
  let l:command = 'g++ -g -o ' . l:executable . ' ' . l:file

  " 编译 C++ 文件
  echo 'Compiling ' . l:file . '...'
  silent execute '!'. l:command
  redraw

  " 如果编译失败，显示错误信息
  if v:shell_error != 0
    echohl ErrorMsg
    echo 'Compilation failed!'
    echohl None
    redraw
    return
  endif

  " 运行调试器
  echo 'Running debugger...'
  redraw

  " 打开终端并运行调试器
  " $H {command}$ is vim-terminal-help Plugin's config
  execute 'H gdb ' . l:executable
endfunction

" press <F5> to compile & run the single cpp file without adding the '-g' argument
func! Run()
  let l:file = expand('%')
  let l:executable = substitute(l:file, '\.cpp$', '', '')
  let l:command = 'g++ -o ' . l:executable . ' ' . l:file
    if expand("%:e") == "c" || expand("%:e") == "cc" || expand("%:e") == "cxx" || expand("%:e") == "cpp"
        echo " compiling..."
        silent execute 'H '. l:command
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
        silent execute 'H ./' . l:executable
    else
        redraw!
        echo "Language not support! :-("
    endif
endfunction 

function! RandomColorTheme()
  " 定义颜色主题列表
  let color_themes = [
        \ 'onedark', 'gruvbox', 'codedark' ,'nord'
        \ ]

  " 随机选择一个颜色主题
  let random_theme = color_themes[rand() % len(color_themes)]

  " 应用选定的颜色主题
  execute 'colorscheme ' . random_theme
endfunction

autocmd VimEnter * call RandomColorTheme()
