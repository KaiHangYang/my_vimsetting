" 2017-08-14 Kaihang


let mapleader=','
let g:mapleader=','


"""""""""""""""""""""""Vundle Setting """"""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle manage the plugin mainly between vundle#begin() and vundle#end()
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/phd'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'derekwyatt/vim-protodef'
Plugin 'suan/vim-instant-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
" 缩进显示管理
Plugin 'nathanaelkane/vim-indent-guides'
" 文件快速切换
Plugin 'derekwyatt/vim-fswitch'
" indexer 管理ctags的插件
Plugin 'vim-scripts/vimprj'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/indexer.tar.gz'
" 代码收藏显示 
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/OmniCppComplete'
" template complete
" vim syntax complete YCM
Plugin 'Valloric/YouCompleteMe'
" muti windows
Plugin 'fholgado/minibufexpl.vim'
" syntax highlight for python
Plugin 'hdima/python-syntax'
" Plugin 'python-mode/python-mode'
Plugin 'jiangmiao/auto-pairs'
" AsyncRun
Plugin 'skywind3000/asyncrun.vim'
call vundle#end()
filetype plugin indent on
""""""""""""""""" set the scheme
set laststatus=2
" 显示光标当前位置
set ruler
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
let g:Powerline_colorscheme='solarized256'
set background=dark
colorscheme molokai

"""""""""""""" vim-indent guide config
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" vim-fswitch <silent> 表示静默的执行命令
nmap <silent> <Leader>sw :FSHere<cr>
""""""""""""" vim-signature setting 
let g:SignatureMap = {
\ 'Leader'             :  "m",
\ 'PlaceNextMark'      :  "m,",
\ 'ToggleMarkAtLine'   :  "m.",
\ 'PurgeMarksAtLine'   :  "m-",
\ 'DeleteMark'         :  "dm",
\ 'PurgeMarks'         :  "mda",
\ 'PurgeMarkers'       :  "m<BS>",
\ 'GotoNextLineAlpha'  :  "']",
\ 'GotoPrevLineAlpha'  :  "'[",
\ 'GotoNextSpotAlpha'  :  "`]",
\ 'GotoPrevSpotAlpha'  :  "`[",
\ 'GotoNextLineByPos'  :  "]'",
\ 'GotoPrevLineByPos'  :  "['",
\ 'GotoNextSpotByPos'  :  "mn",
\ 'GotoPrevSpotByPos'  :  "mp",
\ 'GotoNextMarker'     :  "[+",
\ 'GotoPrevMarker'     :  "[-",
\ 'GotoNextMarkerAny'  :  "]=",
\ 'GotoPrevMarkerAny'  :  "[=",
\ 'ListLocalMarks'     :  "ms",
\ 'ListLocalMarkers'   :  "m?"
\ }
"""""""""" ctag plugin tagbar
let tagbar_left=0
nmap <F3> :TagbarToggle<CR>
let tagbar_width=32
let g:tarbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
    \ 'c:classes:0:1',
    \ 'd:macros:0:1',
    \ 'e:enumerators:0:0', 
    \ 'f:functions:0:1',
    \ 'g:enumeration:0:1',
    \ 'l:local:0:1',
    \ 'm:members:0:1',
    \ 'n:namespaces:0:1',
    \ 'p:functions_prototypes:0:1',
    \ 's:structs:0:1',
    \ 't:typedefs:0:1',
    \ 'u:unions:0:1',
    \ 'v:global:0:1',
    \ 'x:external:0:1'
\ ],
\ 'sro'        : '::',
\ 'kind2scope' : {
    \ 'g' : 'enum',
    \ 'n' : 'namespace',
    \ 'c' : 'class',
    \ 's' : 'struct',
    \ 'u' : 'union'
\ },
\ 'scope2kind' : {
    \ 'enum'      : 'g',
    \ 'namespace' : 'n',
    \ 'class'     : 'c',
    \ 'struct'    : 's',
    \ 'union'     : 'u'
\ }
\}

"""""""""" ctag peizh 
nmap <Leader>tn :tnext<CR>
nmap <Leader>tn :tprevious<CR>
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" omnicpp complete
" let OmniCpp_DefaultNamespaces=["_GLIBCXX_STD"]
" set tags+=/usr/include/c++/5.4.0/stdcpp.tags

"""""""""" YCM setting
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_idettifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/usr/include/c++/5.4.0/stdcpp.tags
let g:ycm_global_ycm_extra_conf='/home/kaihang/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" set the color scheme 
" highlight YcmWarningLine guibg=#3f0000
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=1
" open the pyhton support
let g:ycm_python_binary_path='python'
"""""""""""""" NERDtree
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <F2> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

""""""""""""""MiniBuff setting
map <Leader>bt :MBEToggle<CR>
map <Leader>bd :MBEbd<CR>
map <Leader><Tab> :MBEbn<cr>
map <Leader><S-Tab> :MBEbp<cr>
""""""""""""" python-syntax setting
let python_highlight_all=1
"""""""""" YCM jump
map <Leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""""""""""""" VIM SETTING WITHOUT PLUGINS """""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" switch at the paired symbol
nmap <Leader>m %
vmap <Leader>m %

" leave feel lines while scrolling
set scrolloff=20

" Copy the select thing to system clipboard
vnoremap <Leader>y "+y
" pase the system clipboard thing to vim
noremap <Leader>p "+p
" quick save <CR> means \n next line
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
" Realtime change the vimrc changes
" autocmd BufWritePost $MYVIMRC source $MYVIMRC


" Open realtime search and ignore case
set incsearch
set ignorecase
set nocompatible
set wildmenu

" set the tabstop
set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
" set the tab to 4 blank
" set expandtab

" F2 to toggle the line number 

set number
" relativenumber 可以设置相对行号
function! HideNumber()
	if(&relativenumber == &number)
	    set number!
	elseif(&number)
	    set number!
	endif
	set number?
endfunc
nnoremap <Leader>nt :call HideNumber()<CR>

" set the cursor to the last place when you open it
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | 
endif
" disable the cursor blink and the scroll bar
" change the font type
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止代码折行
set nowrap
" 禁止光标闪烁
set gcr=a:block-blinkoff1
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" systax highlight
syntax enable
syntax on
" 设置代码折叠
"  set foldmethod=indent
set foldmethod=syntax
set nofoldenable
" 解决vim无法删除换行符的问题
set nocompatible
set backspace=indent,eol,start

" vim 保存环境
"" 设置环境保存项
"set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
"" 保存 undo 历史
"set undodir=~/.undo_history/
"set undofile
"" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
" set the height and color of the popup
highlight Pmenu ctermfg=7 ctermbg=4 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=0 ctermbg=2 guifg=#AFD700 guibg=#106900
set pumheight=8
" set the selection color of visual mode
highlight Visual ctermfg=White ctermbg=Gray gui=none

""""""""""" run python 
map <Leader><F5> :call <SID>CompileRunGccOut()<CR>
function! s:CompileRunGccOut()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<;time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<; time ./%<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunction

map <F5> :call <SID>CompileRunGcc()<CR>
augroup SPACEVIM ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END
function! s:CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<;time ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun! g++ % -o %<; time ./%<"
    elseif &filetype == 'sh'
        exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
        exec "AsyncRun! time python %"
    endif
endfunction
" set the undo history
set undodir=~/.vim/undo_history
set undofile

" set one key make 
" nmap <Leader><F5> :wa<CR>:make<CR><CR>:cw<CR>
nmap <Leader>r :wa<CR>:make<CR>:cw<CR><CR>:!./main<CR>
