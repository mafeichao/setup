"********************************************************  
"                   一般性配置                          *  
"********************************************************
"关闭vim一致性原则  
set nocompatible  

"搜索高亮
set hlsearch

"显示行号  
set number  
   
"设置在编辑过程中右下角显示光标的行列信息  
set ruler  
   
"在状态栏显示正在输入的命令  
set showcmd  
   
"设置历史记录条数  
set history=1000  
   
"设置取消备份 禁止临时文件的生成  
set nobackup  
set noswapfile  
   
"设置匹配模式  
set showmatch  
   
"设置C/C++方式自动对齐  
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
set mouse-=a  
   
"设置tab宽度  
set tabstop=4  
   
"设置自动对齐空格数  
set shiftwidth=4  
   
"设置退格键时可以删除4个空格  
set smarttab  
set softtabstop=4  
   
"将tab键自动转换为空格  
set expandtab  
   
"设置编码方式  
set encoding=utf-8  
   
"自动判断编码时 依次尝试以下编码  
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"屏幕编码
set termencoding=utf-8

"检测文件类型  
filetype on  
   
"针对不同的文件采取不同的缩进方式  
filetype indent on  
   
"允许插件  
filetype plugin on  
   
"启动智能补全  
filetype plugin indent on  

"设置颜色方案
colorscheme ron

"设置当前行横线
set cursorline

"保存上次打开位置
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"*********************************************************  
"                  vundle 配置                           *  
"*********************************************************  
   
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()  
   
" let Vundle manage Vundle  
Bundle 'gmarik/vundle'  
    
" My Bundles here:  
   
Bundle 'tpope/vim-fugitive'  
Bundle 'Lokaltog/vim-easymotion'  
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
Bundle 'tpope/vim-rails.git'  
Bundle 'taglist.vim'  
Bundle 'The-NERD-tree'  
Bundle 'Syntastic'  
Bundle 'L9'  
Bundle 'FuzzyFinder'  
Bundle 'Lokaltog/vim-powerline'  
Bundle 'Valloric/YouCompleteMe'   

"*****************************************************  
"                   taglist配置                      *  
"*****************************************************  
   
"不显示"press F1 to display help"  
let Tlist_Compact_Format=1  
   
"窗口在左侧显示  
let Tlist_Use_Right_Window=1  
   
"只显示当前文件的tags  
let Tlist_Show_One_File=1    
   
"高亮显示  
let Tlist_Auto_Highlight_tag=1  
   
"随文件自动更新  
let Tlist_Auto_Update=1  
   
"设置宽度  
let Tlist_WinWidth=30         
   
"taglist窗口是最后一个窗口，则退出vim  
let Tlist_Exit_OnlyWindow=1   
   
"单击跳转  
let Tlist_Use_SingClick=1  
   
"打开关闭快捷键  
nnoremap <silent> <F8> :TlistToggle<CR>  

"********************************************************  
"                      NERD_Tree 配置                   *  
"********************************************************  
   
"显示增强  
let NERDChristmasTree=1  
   
"自动调整焦点  
let NERDTreeAutoCenter=1  
   
"鼠标模式:目录单击,文件双击  
let NERDTreeMouseMode=2  
   
"打开文件后自动关闭  
let NERDTreeQuitOnOpen=1  
   
"显示文件  
let NERDTreeShowFiles=1  
   
"显示隐藏文件  
let NERDTreeShowHidden=1  
   
"高亮显示当前文件或目录  
let NERDTreeHightCursorline=1  
   
"显示行号  
let NERDTreeShowLineNumbers=1  
   
"窗口位置  
let NERDTreeWinPos='left'  
   
"窗口宽度  
let NERDTreeWinSize=31  
   
"不显示'Bookmarks' label 'Press ? for help'  
let NERDTreeMinimalUI=1  
   
"快捷键  
nnoremap <silent> <F4> :NERDTreeToggle<CR>  

let NERDTreeQuitOnOpen=0
 
"*****************************************************  
"           YouCompleteMe配置                        *  
"*****************************************************  
   
"leader映射为逗号“，”  
let mapleader = ","    
   
"配置默认的ycm_extra_conf.py  
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'   

"按,jd 会跳转到定义  
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>     
nnoremap gt :YcmCompleter GoToDefinitionElseDeclaration<CR>     
   
"打开vim时不再询问是否加载ycm_extra_conf.py配置  
let g:ycm_confirm_extra_conf=0     
   
"使用ctags生成的tags文件  
let g:ycm_collect_identifiers_from_tag_files = 1   

"*****************************************************  
"           Syntastic配置                            *  
"*****************************************************  
let g:Syntastic_check_on_open=1 
