source $VIMRUNTIME\vimrc_example.vim
source $VIMRUNTIME\mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"********************************************************  
"                   一般性配置                          *  
"********************************************************  
"文件里乱码问题
"设置编码方式  
set encoding=utf-8  
   
"自动判断编码时 依次尝试以下编码  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

set pythondll = 
"解决菜单乱码
source $VIMRUNTIME\delmenu.vim
source $VIMRUNTIME\menu.vim
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
 
"在状态栏显示正在输入的命令  
set showcmd  
   
"设置历史记录条数  
set history=1000  
   
"设置取消备份 禁止临时文件的生成  
set nobackup  
set noswapfile  
   
"设置匹配模式  
set showmatch  
   
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
   
"设置退格键时可以删除4个空格  
set smarttab  
set softtabstop=4  
   
"将tab键自动转换为空格  
set expandtab  
   
"检测文件类型  
set nocompatible
filetype off 
   
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
set rtp+=$VIM\vimfiles\bundle\vundle\
call vundle#rc('$VIM\vimfiles\bundle\')
Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
    let Tlist_Ctags_Cmd='ctags'
    let Tlist_Show_One_File=1
    let Tlist_WinWidt = 28
    let Tlist_Exit_OnlyWindow = 1
    let Tlist_Use_Right_Window = 1
Bundle 'majutsushi/tagbar'
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_width = 28
    let g:tagbar_right = 1
    autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
    map <F3> :TagbarToggle<CR>
Bundle 'scrooloose/nerdtree'
    let NERDTreeWinPos = 'left'
    let NERDTreeWinSize = 28
    map <F2> :NERDTreeToggle<CR>
"Bundle 'fholgado/minibufexpl.vim'
"    let g:miniBufExplMapWindowNavVim = 1
"    let g:miniBufExplMapWindowNavArrows = 1
"    let g:miniBufExplMapCTabSwitchBufs = 1
"    let g:miniBufExplModSelTarget = 1
"    let g:miniBufExplMoreThanOne= 0
"    map <special><F10> :MBEbp<CR>
"    map <special><F12> :MBEbn<CR>

Plugin 'bling/vim-airline' 
    let g:airline_theme="dark" 

    "这个是安装字体后 必须设置此项" 
    let g:airline_powerline_fonts = 1   

     "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
     let g:airline#extensions#tabline#enabled = 1
     let g:airline#extensions#tabline#buffer_nr_show = 1

    "设置切换Buffer快捷键"
     nnoremap <F12> :bn<CR>
     nnoremap <F10> :bp<CR>
     " 关闭状态显示空白符号计数
     let g:airline#extensions#whitespace#enabled = 0
     let g:airline#extensions#whitespace#symbol = '!'
     " 设置consolas字体"前面已经设置过
     "set guifont=Consolas\ for\ Powerline\ FixedD:h11
     if !exists('g:airline_symbols')
         let g:airline_symbols = {}
     endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

      " powerline symbols
    "  let g:airline_left_sep = ''
    "  let g:airline_left_alt_sep = ''
    "  let g:airline_right_sep = ''
    "  let g:airline_right_alt_sep = ''
    "  let g:airline_symbols.branch = ''
    "  let g:airline_symbols.readonly = ''
    "  let g:airline_symbols.linenr = '☰'
    "  let g:airline_symbols.maxlinenr = ''

        " old vim-powerline symbols
    "  let g:airline_left_sep = '⮀'
    "  let g:airline_left_alt_sep = '⮁'
    "  let g:airline_right_sep = '⮂'
    "  let g:airline_right_alt_sep = '⮃'
    "  let g:airline_symbols.branch = '⭠'
    "  let g:airline_symbols.readonly = '⭤'
    "  
    "  let g:airline_symbols.linenr = '⭡'
"Bundle 'Valloric/YouCompleteMe'
"   let g:ycm_server_python_interpreter='C:\Users\loadi\AppData\Local\Programs\Python\Python36\python.exe'
"   let g:ycm_collect_identifiers_from_tag_files = 1
"   let g:ycm_seed_identifiers_with_syntax = 1
"   let g:ycm_confirm_extra_conf=0
"   inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"   "在注释输入中也能补全
"   let g:ycm_complete_in_comments = 1
"   "在字符串输入中也能补全
"   let g:ycm_complete_in_strings = 1 
"   " 输入第一个字符就开始补全
"   let g:ycm_min_num_of_chars_for_completion=2
"   let g:ycm_error_symbol = '>>'
"   let g:ycm_warning_symbol = '>*'
"   nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"   nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"   nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"   set completeopt=longest,menu
Bundle 'scrooloose/nerdcommenter'
Bundle 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<C-p>'
    let g:ctrlp_cmd = 'CtrlP'
    map <leader>f :CtrlPMRU<CR>
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_by_filename = 1
Bundle "scrooloose/syntastic" 
    let g:ctrlp_regexp = 1
Bundle "Valloric/MatchTagAlways"
"针对不同的文件采取不同的缩进方式  
filetype indent on  
