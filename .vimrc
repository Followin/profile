filetype on
filetype indent on
filetype plugin on
set ignorecase
set hlsearch
set incsearch
set smartcase
set relativenumber
syntax enable
set number
set backspace=indent,eol,start
set ts=4 sts=2 sw=2 expandtab
set smarttab
set wrap
set autoindent
set smartcase
set showcmd
set cursorline
set scrolloff=4
set binary
set noeol
autocmd BufRead,BufNewFile *.xaml set filetype=xml
autocmd BufRead,BufNewFile *.md set filetype=markdown
set wildmenu
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <A-j> <A-Down>
set wildignore+=*\\tmp\\*,*\\node_modules\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = '\v[\/]((\.(git|hg|svn))|node_modules)'
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction
function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()
function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()
"EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
"
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
set noswapfile