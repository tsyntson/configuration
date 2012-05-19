"设定文件编码
set encoding=utf-8
set fileencodings=utf-8,big5,ucs-bom,gb18030,gbk,gb2312,cp936

"开启语法加亮
syntax on
"配色风格
colorscheme pablo
colorscheme grey2

"设定行距 GUI 界面中生效
set linespace=4
"设定 GUI 选项
"set guioptions=gmrLtT  m:菜单 T:工具栏
set guioptions=gmrLt
"显示标尺
set ruler
set nu

"自动折行
"set nowrap
set wrap
"按完整单词折行
set nolinebreak
"set linebreak
"行宽（输入时自动插入换行符）
"set textwidth=80
set textwidth=0

"允许在虚空间内操作 （虚空间:不包含任何文本的空间。如换行符之后）
"set virtualedit=all
"禁止在 虚空间 内操作
set virtualedit=

"设定 Tab 键缩进的空格数
set tabstop=4
"设定编辑器将多少空格视为一个缩进
set shiftwidth=4
"将缩进转换为空格
"set expandtab
"设定自动缩进(新行与前一行缩进相同)
set autoindent
"set noautoindent
"插入模式下，“←”如何删除光标前的字符：行首空白、换行符、插入点之前的字符
set backspace=indent,eol,start

"运行在非兼容(VI)模式下(命令模式下 TAB 补全)
set nocompatible
"命令行历史纪录
set history=500

"禁用增量搜索
set incsearch
"set noincsearch
"搜索时忽略大小写
"set ignorecase
"set noignorecase
"高亮显示搜索结果
set hlsearch

"设定折叠方式
"set foldmethod=manual

"以下字符将被视为单词的一部分 (ASCII)：
"set iskeyword+=33-47,58-64,91-96,123-128

noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>
"作用范围 键位 功能

"自动补全方式：(使用逗号分隔)
"set complete=k,.

"   .    当前文件
"   b    已被装缓冲区,但是没有在窗口内的文件
"   d    在当前的文件中定义和由 #include 包含进来的文件
"   i    由 #include 包含进来的文件
"   k    由 dictionary 选项定义的文件
"   kfile    名为{file}的文件
"   t    标记(tags)文件
"   u    没有载入的缓冲区
"   w    在其他窗口中的文件

"设定自动补全字典 ：
"set dictionary=path

"设定折叠方式
set foldmethod=indent

" manual 手动折叠
" indent 按缩进折叠
" marker 按标记折叠
" syntax 按语法折叠
" expr   按表达式折叠

set	helplang=cn
set tags=/home/tsyntson/backup/tags
filetype plugin indent on
set completeopt=longest,menu

set backup
set backupdir=/home/tsyntson/backup
set backupext=.bak
"自动切换当前目录为当前文件所在的目录
set autochdir
"开启新行时使用智能自动缩进
set smartindent
"设定命令行数及状态栏
set cmdheight=2
set laststatus=2

"工作目录随文件变
autocmd BufEnter * cd %:p:h
"设置状态栏
set statusline+=%f
"不显示工具条
set guioptions-=T
"显示横向滚动条
set guioptions+=b
"设置自动补全
setl omnifunc=nullcomplete#Complete
autocmd FileType * setl omnifunc=nullcomplete#Complete
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
autocmd FileType c setl omnifunc=ccomplete#Complete
"设置智能大小写查找
set ignorecase smartcase
"设置标签
function GuiTabLabel()
	let label = ''
	let bufnrlist = tabpagebuflist(v:lnum)
	"如果标签页里有修改过的缓冲区，加上 '+'
	for bufnr in bufnrlist
		if getbufvar(bufnr, "&modified")
			let label = '+'
			break
		endif endfor
		"如果标签页里的窗口数目多于一，加上窗口数目
		let wincount = tabpagewinnr(v:lnum, '$')
		if wincount > 1
			let label .= wincount
		endif
		if
			label != ''
			let label .= ' '
		endif
		"附加缓冲区名
		label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
	endfunction
	set guitablabel=%{GuiTabLabel()}
	set guitablabel=%N\ %f
	"设置php注释
	""source $vimruntime\vimfiles\plugin\php-doc.vim
	inoremap :call PhpDocSingle()i
	nnoremap :call PhpDocSingle()
	vnoremap :call PhpDocRange()
	"设置putty
	let g:netrw_sftp_cmd = "PSFTP"
	"设置quickfix
	"php语法检查
	setlocal makeprg=\"d:\wamp\bin\php\php5.2.6\php.exe\"\ -l\ -n\ -d\ html_errors=off\ %
	setlocal errorformat=%m\ in\ %f\ on\ line\ %l
	"autocmd BufWritePost *.php,*.phps :make
	"map :w:noh:make
"使用<C-J>打开并最大化当前窗口下面的窗口，使用<C-K>打开并最大化当前窗口上面的窗口
"map	<C-J><C-W>j<C-W>_
"map	<C-K><C-W>k<C-W>_
"允许拆分窗口将大小减少至一个单独的行
set	wmh=0
