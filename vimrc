"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Ubuntu
"
" Last Change: 2012年04月20日 15时13分 
"
" Version:     1.00
"
"=========================================================================

syntax on					"语法高亮

set cursorline				" 突出显示当前行

set nocompatible			" 不要使用vi的键盘模式，而是vim自己的

set history=50				" 保持50行的命令行历史

set showcmd					" 显示未完成的命令

set hlsearch				" 搜索逐字符高亮

set incsearch				" 搜索中匹配 

set number					" 显示行号
"set nonu					" 不显示行号

set autoindent				" 自动缩进

set cindent					" C缩进

set smartindent				" 智能缩进

set noet					" tab不是空格 写makefile时的命令前的tab

set tabstop=4				" 硬缩进

set shiftwidth=4			" 缩进空格数

set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

set showmatch				" 显示匹配括弧

"set nowrapscan              " 禁止在搜索到文件两端时重新搜索

set noeb					" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=

set shortmess=atI			" 启动的时候不显示那个援助索马里儿童的提示

set clipboard+=unnamed		" 与windows共享剪切板

set cmdheight=2				" 命令行高度

set so=7					" 滚动鼠标滑轮，一次7行

set nobackup				" 不产生备份文件

set nowb					" 取消交换区

set noswapfile				" 取消swap文件

colorscheme evening			" 颜色配置文件在/usr/share/vim/vim72/colors/目录下

" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 代码折叠功能
"set foldenable              " 开始折叠
"set foldmethod=marker       " 设置语法折叠
"set foldcolumn=0            " 设置折叠区域的宽度
"setlocal foldlevel=1        " 设置折叠层数为
"set foldclose=all           " 设置为自动关闭折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 看代码快捷键设置
nmap <F9> <C-W>w "两个文件间进行切换
nmap <F7> <C-W>< "左移
nmap <F8> <C-W>> "右移

" vim快捷键设置
nmap :WQ<ENTER> :wq<ENTER>
nmap :Q<ENTER> :q<ENTER>

" 文件编码格式
let&termencoding=&encoding
set fileencodings=utf8,gbk,prc,ucs-bom


" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"显示TAB键，tab键为>-，空格键+
"set list
"set listchars=trail:+,tab:>-

"如何使用cscope,ctags
"ctags -R
"mv tags ../
"cscope -Rbq
"mv ../tags ./
"cs add ~/cscope.out ~/

"set tags=/home/dongyl/source/linux-2.6.36/tags
"cs add /home/dongyl/source/linux-2.6.36/cscope.out /home/dongyl/source/linux-2.6.36/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     CTags设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 是否高亮显示当前标签
let Tlist_Auto_Highlight_Tag = 1

" 自动打开Tlist
let Tlist_Auto_Open = 0

" 自动更新Tlist
let Tlist_Auto_Update = 1

" 选择标签或文件后是否自动关闭标签列表窗口
let Tlist_Close_On_Select = 0

" 压缩方式
let Tlist_Compact_Format = 1

" 是否在标签列表窗口用标签原型替代标签名
let Tlist_Display_Prototype = 0

" 在标签名后是否显示标签有效范围
let Tlist_Display_Tag_Scope = 1

" 不显示折叠树
let Tlist_Enable_Fold_Column = 1

" 关闭VIM同时关闭Tlist
let Tlist_Exit_OnlyWindow = 1

" 不关闭其他的tags
let Tlist_File_Fold_Auto_Close = 0

" 为1则使用TlistToggle打开标签列表窗口后会获焦点至于标签列表窗口；为0则taglist打开后焦点仍保持在代码窗口
" let Tlist_GainFocus_On_ToggleOpen = 0

" 显示标签列表窗口时允许/禁止扩展Vim窗口宽度
let Tlist_Inc_Winwidth = 1

" F3开关Tlist
nmap <F3> :Tlist<ENTER>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      winManager设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置界面分割
let g:winManagerWindowLayout = "TagList|FileExplorer"

" 设置winmanager的宽度，默认为25
let g:winManagerWidth = 30

" 定义打开关闭winmanager按键
nmap wm :WMToggle<cr>

" 只剩下一个窗口时，退出
let g:persistentBehaviour=0

" 进入VIM的时候自动打开
let g:AutoOpenWinManager = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		光标所在位置,F,查字典
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  25vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nmap F :call Mydict()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		cscope设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
"	set cscopequickfix=s-,c-,d-,i-,t-,e-
	nmap s :cs find s <C-R>=expand("<cword>")<CR><CR> 
	nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR> 
	nmap c :cs find c <C-R>=expand("<cword>")<CR><CR> 
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
	nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		使用S-r键自动添加打印信息到代码中
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <S-r> :%s/)\n{/)\r{\r\#ifdef DEBUG_DYL\r\tprintk(\"[dongyulong] %s %d %s\\n\",__FILE__, __LINE__, __func__);\r\#endif/g <CR>
