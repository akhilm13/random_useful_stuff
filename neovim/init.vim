call plug#begin()

" Initialize plugin system
" " - Automatically executes `filetype plugin indent on` and `syntax enable`.
" " You can revert the settings after the call like so:
" "   filetype indent off   " Disable file-type-specific indentation
syntax on            " Disable syntax highlighting

" Shorthand notation
 Plug 'patstockwell/vim-monokai-tasty' "Theme
 Plug 'itchyny/lightline.vim' "Status line
" Plug 'jalvesaq/Nvim-R' "R TCP Server
 Plug 'ncm2/ncm2' " Autocompletion Plugin
 Plug 'ncm2/ncm2-path' "Path Completion
 Plug 'roxma/nvim-yarp' "Remote plugin framework
" Plug 'jalvesaq/Nvim-R' "R AutoComplete
" Plug 'gaalcaras/ncm-R' "R Autocomplete
 Plug 'preservim/nerdtree' " Nerdtree
 Plug 'Raimondi/delimitMate' " Autoclose paranthesis and quotes and stuff
 Plug 'ncm2/ncm2-jedi' "Python autocomplete
 Plug 'MunifTanjim/nui.nvim' "UI Component lib for nvim
 Plug 'smzm/hydrovim' "Python exec
 Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' } " Plugin for Jupyter like behaviour

call plug#end()


let mapleader = ","
let g:mapleader = ","

"Plugin related settings

"autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
"set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.
						    "

"ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" NERD Tree
map <leader>nn :NERDTreeToggle<CR>                  " Toggle NERD tree.

set si                          " To switch on smart indentation.

" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.

" Python mapping
" autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" Errors
set noerrorbells                " No annoying sound on errors.


" Color & Fonts
syntax enable                   " Enable syntax highlighting.
set encoding=utf8                " Set utf8 as standard encoding and 

let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
let g:vim_monokai_tasty_machine_tint = 1              " use `mahcine` colour variant
let g:vim_monokai_tasty_highlight_active_window = 1   " make the active window stand out
colorscheme vim-monokai-tasty                         " set the colorscheme

" en_US as the standard language.
" Relative Numbering
set relativenumber 

" Key Mappings
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
vnoremap , <Plug>RDSendSelection
nnoremap , <Plug>RESendLine

"magma setting
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

set equalalways

