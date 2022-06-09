" switches on syntax highlighting
syntax on

"%%%%%%%%%%
" Settings
"%%%%%%%%%%
" no sounds when some error occurs
set noerrorbells
" tabstop sets the tab key to output only four characters and softabstop sets those characters to spaces
set tabstop=4 softtabstop=4
" shiftwidth is the the amount of characters to move when shift and tab is used together, setting this to four characters
set shiftwidth=4
" convert a tab character to spaces
set expandtab
" tries to indent code on it's own
set smartindent
set autoindent
set cindent
set smarttab
" set line numbers for files
set nu
" avoid line wrapping
set nowrap
" searching and similar operations are case insenstive until it detects a capital letter
set smartcase
" no swap files
set noswapfile
" no backup
set nobackup
" enable plugin for netrw and the indent here adds the tab for every code
" block in python
filetype plugin indent on
" don't behave like vi
set nocompatible
" to enable recursive file searching from project home directory
set path+=**
" to show options while searching
set wildmenu
" splits below
set splitbelow
" adjusting terminal size
set termwinsize=15x0
" highlight text while writing
set incsearch


"%%%%%%%%%
" Plugins
"%%%%%%%%%
call plug#begin("~/.vim/plugged")
" autoclose
Plug 'jiangmiao/auto-pairs'
" htlm like tag closer
Plug 'alvan/vim-closetag'
"adds color to color codes
Plug 'ap/vim-css-color'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


"%%%%%%%%%%%%%%%%
" Plugin Settings
"%%%%%%%%%%%%%%%%
set termguicolors
set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
"*******
" NETRW
"*******
let g:netrw_liststyle=3
let g:netrw_banner=0

"**************
" vim-closetag
"**************
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 0
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"%%%%%%%%%%
" Mappings
"%%%%%%%%%%
"**********************
" INSERT MODE MAPPINGS
"**********************
" set the jh key combination in insert mode to behave like the escape key
imap jh <ESC>
"**********************
" NORMAL MODE MAPPINGS
"**********************
let mapleader=" "
" this is to switch between split windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" open netrw file manager and resize it to 30%
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" start recursive search in command mode
nnoremap <leader>f :find
" types vsplit or split in command mode, just need to enter a file name to start in vertical split mode now
nnoremap <leader>V :vsplit
nnoremap <leader>H :split
" vertical resize shortcuts
nnoremap <leader>r :exe "vertical resize " . ((winwidth(0) + winwidth(1)) * 1/2)<CR>
nnoremap <leader>rr :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
" open terminal below all the split windows
nnoremap <leader>t :bo term<CR>clear<CR>
" resize the terminal to 0 horizontally and switch to the file above
nnoremap <leader>T :resize 0<CR>:wincmd k<CR>
" recover the terminal from size 0 to 15 and focus on terminal
nnoremap <leader>rt :wincmd j<CR>:resize 15<CR>i
" move between tabs
" cycle tabs
nnoremap <tab> : tabn<CR>
" move forward and back
nnoremap <F2> : +tabn<CR>
nnoremap <F1> : -tabn<CR>
" create a new tab
nnoremap <leader>nt :tabe<CR>

" move one bufferforward
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" search for a tag in a taglist
nnoremap <leader>s :tselect
" generate new taglist
nnoremap <leader>tl :!ctags -R .<CR>

"**********************
" VISUAL MODE MAPPINGS
"**********************
vmap <Tab> >gv
vmap <S-Tab> <gv

"%%%%%%%%%%
" Snippets
"%%%%%%%%%%
"**********
" Python
"**********
" canvas
nnoremap ,canvas :-1read $HOME/.vim/snippets/canvas.kv<CR>2j2w2l
" basic kivy app
nnoremap ,kivy :-1read $HOME/.vim/snippets/kivyapp.py<CR>5jw
"******
" HTML
"******
" html template
nnoremap ,html :-1read $HOME/.vim/snippets/html.html<CR>7j5li
