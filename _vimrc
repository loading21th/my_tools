"********************************************************  
"                   一般性配置                          *  
"********************************************************  
"文件里乱码问题
"设置编码方式  
set encoding=utf-8  

"设置不产生un~文件   
"set noundofile
set nobackup
set noswapfile

"自动判断编码时 依次尝试以下编码  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

"解决consle输出乱码
language messages zh_CN.utf-8

"关闭vim一致性原则  
set nocompatible  
   
"显示行号  
set number  
   
"设置在编辑过程中右下角显示光标的行列信息  
set ruler  

"设置不换行
set nowrap  
 
"在状态栏显示正在输入的命令  
set showcmd  
   
"设置历史记录条数  
set history=1000  
   
"设置取消备份 禁止临时文件的生成  
set nobackup  
set noswapfile  
   
"设置匹配模式  
set showmatch  
set matchtime=0
   
"设置C\C++方式自动对齐  
set autoindent  
set cindent  
   
"开启语法高亮功能  
syntax enable  
syntax on  
   
"指定配色方案为256色  
set t_Co=256  
   
"设置搜索时忽略大小写  
set ignorecase  
   
"配置backspace的工作方式  
set backspace=indent,eol,start  
   
"设置在vim中可以使用鼠标  
"set mouse=a  
   
"设置tab宽度  
set tabstop=4  
   
"设置自动对齐空格数  
set shiftwidth=4  
set shiftround "取整缩进 
   
"设置退格键时可以删除4个空格  
set smarttab  
set softtabstop=4  
   
"将tab键自动转换为空格  
set expandtab  
   
"检测文件类型  
set nocompatible
filetype on 
   
"针对不同的文件采取不同的缩进方式  
filetype indent on  
   
"允许插件  
filetype plugin on  
   
"启动智能补全  
filetype plugin indent on  
  
"设置帮助文档语言
set helplang=cn

"设置搜索高亮
set hlsearch
set showmatch
"设置字体大小
set guifont=courier_new:h10
"设置缩进方式   za,zA
set fdm=indent
set foldlevelstart=99

"针对不同的文件采取不同的缩进方式  
filetype indent on 
"使用系统粘贴板
colorscheme desert
set clipboard^=unnamed,unnamedplus
"选中当前单词并高亮所有搜索
nnoremap & *#

"优先搜索编辑文件所在目录的tags文件，之后向上搜索，在之后搜索当前命令所在路径的tags文件
set tags=./tags;,tags

" cscope -Rbq
set nocsverb
if has ("cscope")
	" add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
	set cscopetag
	set csto=0
	set csverb
    "默认模式
	"set cscopequickfix=
    "quickfix模式
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "查符号引用
	nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<cr> 
    "查定义
	nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
    "查被调用
	nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif

    "设置切换Buffer快捷键"
     "nnoremap <F9> :tabn<CR>   " tab 后移
     "nnoremap <F8> :tabp<CR>   " tab 前移
     nnoremap <F12> :bn<CR>   " buffer 后移
     nnoremap <F10> :bp<CR>   " buffer 前移
     "nnoremap <leader>q :cprev<CR>   " quickfix 前移
     "nnoremap <leader>w :cnext<CR>   " quickdix 后移
     "autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
     "set switchbuf+=newtab

call plug#begin('$HOME/.vim/plugged')
Plug 'majutsushi/tagbar'
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_autofocus = 1
    let g:tagbar_width = 28
    let g:tagbar_right = 1
    let g:tagbar_sort = 0
    "autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
    nnoremap <F3> :TagbarToggle<CR>

"###########################################nerdtree
Plug 'scrooloose/nerdtree'
    let NERDTreeWinPos = 'left'
    let NERDTreeWinSize = 28
    nnoremap <F2> :NERDTreeToggle<CR>

Plug 'bling/vim-airline' 
    let g:airline_theme="dark" 

    "这个是安装字体后 必须设置此项" 
    let g:airline_powerline_fonts = 1   

     "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
     let g:airline#extensions#tabline#enabled = 1
     let g:airline#extensions#tabline#buffer_nr_show = 1

     " 关闭状态显示空白符号计数
     let g:airline#extensions#whitespace#enabled = 0
     let g:airline#extensions#whitespace#symbol = '!'
     " 设置consolas字体"前面已经设置过
     "set guifont=Consolas\ for\ Powerline\ FixedD:h11
     if !exists('g:airline_symbols')
         let g:airline_symbols = {}
     endif

 " unicode symbols
  let g:airline_left_sep = '?'
  let g:airline_left_sep = '?'
  let g:airline_right_sep = '?'
  let g:airline_right_sep = '?'
  let g:airline_symbols.crypt = '??'
  let g:airline_symbols.linenr = '?'
  let g:airline_symbols.linenr = '?'
  let g:airline_symbols.linenr = '?'
  let g:airline_symbols.linenr = '?'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '?'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'T'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = '?'
  let g:airline_symbols.notexists = '?'
  let g:airline_symbols.whitespace = 'Ξ'

"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"     "map <leader>f Leaderf file<CR>默认
"     "map <leader>b Leaderf buffer<CR>默认
"     "normal模式---i---查找模式---Tab---normal模式
"     nnoremap <leader>t :Leaderf tag<CR>
"     nnoremap <leader>u :Leaderf! function<CR>
"     let g:Lf_RootMarkers = ['.git', '.svn']
"     let g:Lf_WorkingDirectoryMode = 'ac'

Plug 'scrooloose/syntastic'
    let g:ctrlp_regexp = 1
Plug 'Valloric/MatchTagAlways'
Plug 'derekwyatt/vim-fswitch'
    au! BufEnter *.cc  let b:fswitchdst = 'h,hpp'
    au! BufEnter *.h  let b:fswitchdst = 'c,cc,cpp'
    nnoremap <leader>s :FSHere<CR>
call plug#end()


"通过<leader>z最大最小化当前分屏
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

" 自动分析加载cscope
func! ReConnectCscope()
    exec "cs kill 0 || echo 'no cscope db and now auto add it'"
    exec "! $HOME/.vim/cscope_db.sh"
    exec "set csprg=cscope"
    exec "cs add cscope.out"
endfunc
map <F4> : call ReConnectCscope()<cr><cr><cr>

set ff=unix

"自动调整quickfix大小
au FileType qf call AdjustWindowHeight(3, 10)
   function! AdjustWindowHeight(minheight, maxheight)
       let l = 1
       let n_lines = 0
       let w_width = winwidth(0)
       while l <= line('$')
           " number to float for division
           let l_len = strlen(getline(l)) + 0.0
           let line_width = l_len/w_width
           let n_lines += float2nr(ceil(line_width))
           let l += 1
       endw

       exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
   endfunction

"添加下划线
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=4

"高亮当前列
set cursorcolumn
hi Search cterm=bold ctermfg=red ctermbg=3                  

hi CursorColumn cterm=bold ctermbg=4

if &diff
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

