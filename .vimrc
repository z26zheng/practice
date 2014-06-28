"add os161 cscope db if exists"
cs add ./cscope.out
if has('cscope')
  set cscopetag cscopeverbose
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif
  cnoreabbrev csa    cs add
  cnoreabbrev csf    cs find
  cnoreabbrev csfcg  cs find c 
  cnoreabbrev csfcd  cs find d 
  cnoreabbrev csfeg  cs find e
  cnoreabbrev csfe   cs find e
  cnoreabbrev csff   cs find f
  cnoreabbrev csfdef cs find g
  cnoreabbrev csfinc cs find i
  cnoreabbrev csfs   cs find s
  cnoreabbrev csft   cs find t
  cnoreabbrev csk    cs kill
  cnoreabbrev csr    cs reset
  cnoreabbrev css    cs show
  cnoreabbrev csh    cs help
  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
"set tab to two spaces
set expandtab
set tabstop=2
"dispoay line number
set nu
"autoindent and smart indent
set cindent 
set smartindent
set autoindent
"wrap lines at 80
set textwidth=80
"trun xyntax highlightin on
syntax on
syntax enable
"hightlight matching braces
set showmatch
"insert new line without entering insertion mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
"CTRL+S to: save files
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i<right>
"imap <C-s> <ESC>:w<CR>i<right>  
"F4 to switch between header/source
map <F6> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
"recreate tags file with F5
"map  :!ctags -R -c-kinds=+p -fields=+iaS -extra=+q .<CR>
"always show current position
set ruler
"height of the command bar
set cmdheight=2
"backspace
"highlight search results
set hlsearch
"Make search act like in browssers
set incsearch
"for regular expressions turn magic on
set magic
"cursorline
set cursorline
"open definition in a vertical tab
map <C-o> :vsp <CR><C-W><C-W>:exec("tag ".expand("<cword>"))<CR>
" Smooth Scrolling 
nnoremap <c-d> :call DelayedFunc("normal! gjzz",winheight(".")/ 2-1,15)<cr> 
nnoremap <c-u> :call DelayedFunc("normal! gkzz",winheight(".")/ 2-1,15)<cr> 

func! DelayedFunc(cmd,...) 
 " cmd , iter , delay 
        let iter=10 
        let delay=20 
        if a:0 == 2 
	        let iter = a:1 
	        let delay = a:2 
	endif 
	let i = 0 
	" first section 
	let ot = iter/5*4 
	let start = range(100,0,eval(-100/(ot-1))) 
	" second section 
	let tt = iter - ot 
	let end = range(0,100,eval(100/(tt-1))) 
	" list of speeds 
	let speed = start + end 
	if a:cmd != "" 
		while i < iter 
		 	execute a:cmd 
			try 
				exec "sleep " . eval(delay*speed[i]/100)."m" 
	            	catch * 
		        endtry 
            		let i = i + 1 
			redraw 
		endwhile 
	endif
endfunc

"comments color
hi Comment ctermfg=8 cterm=none

"hi Cursor guifg=red guibg=red
