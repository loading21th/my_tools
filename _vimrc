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
  
"添加下划线
set cursorline
"高亮当前列
set cursorcolumn
 
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
set mouse=a  
   
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

" Using cscope easily
"if has ("cscope")
"	set cscopetag
"	set csto=0
"	set csverb
"	set cscopequickfix=
"	nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>
"	nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
"	nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>
"	nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>
"	nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>
"	nmap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"	nmap ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
"	nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>
"endif

    "设置切换Buffer快捷键"
     nnoremap <F12> :bn<CR>   " tab 后移
     nnoremap <F10> :bp<CR>   " tab 前移

call plug#begin('$HOME/.vim/plugged')
Plug 'ludovicchabant/vim-gutentags'
    "使用gtags
    let $GTAGSLABEL='native-pygments'
    "let $GTAGSLABEL='native'
    let $GTAGSCONF='/usr/home/liyao5/my_tools/gtags.conf'           "使用绝对路径
    " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []
    if executable('ctags')
    	let g:gutentags_modules += ['ctags']
    endif
    if executable('gtags-cscope') && executable('gtags')
    	let g:gutentags_modules += ['gtags_cscope']
    endif

    " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let g:gutentags_cache_dir = expand('~/.cache/tags')
    
    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    
    " 如果使用 universal ctags 需要增加下面一行
    "let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
    
    " 禁用 gutentags 自动加载 gtags 数据库的行为
    let g:gutentags_auto_add_gtags_cscope = 0
    "let g:gutentags_plus_switch = 1
    let g:gutentags_define_advanced_commands = 1    "打开调试日志，GutentagsToggleTrace,message查看错误
"Plug 'skywind3000/vim-preview'
"    autocmd FileType qf nnoremap <silent><buffer> <CR> :PreviewQuickfix<cr> "Enter打开预览
"    autocmd FileType qf nnoremap <silent><buffer> C :PreviewClose<cr>       "C    关闭预览
"    "noremap <Leader>u :PreviewScroll -0.5<cr> " 往上滚动预览窗口
"    "noremap <leader>d :PreviewScroll +0.5<cr> "  往下滚动预览窗口
"    noremap <leader>c :cclose<CR>                                           "关闭搜索显示            
Plug 'skywind3000/gutentags_plus'
"<leader>cg - 查看光标下符号的定义  
"<leader>cs - 查看光标下符号的引用  
"<leader>cc - 查看有哪些函数调用了该函数  
"<leader>cf - 查找光标下的文件  
"<leader>ci - 查找哪些文件 include 了本文件 
":GscopeFind find s -- 
":GscopeFind find a -- 
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

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
     "map <leader>f Leaderf file<CR>默认
     "map <leader>b Leaderf buffer<CR>默认
     "normal模式---i---查找模式---Tab---normal模式
     nnoremap <leader>t :Leaderf tag<CR>
     nnoremap <leader>u :Leaderf! function<CR>
     let g:Lf_RootMarkers = ['.git', '.svn']
     let g:Lf_WorkingDirectoryMode = 'ac'

Plug 'scrooloose/syntastic'
    let g:ctrlp_regexp = 1
Plug 'Valloric/MatchTagAlways'
Plug 'derekwyatt/vim-fswitch'
    au! BufEnter *.cc  let b:fswitchdst = 'h,hpp'
    au! BufEnter *.h  let b:fswitchdst = 'c,cc,cpp'
    nnoremap <leader>s :FSHere<CR>
call plug#end()


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

"通过<leader>z最大最小化当前分屏
nmap <leader>z :call Zoom()<CR>


set ff=unix
"hi CursorColumn cterm=bold ctermbg=2
hi CursorColumn cterm=bold ctermbg=4
hi Search cterm=bold ctermfg=red ctermbg=3                  
