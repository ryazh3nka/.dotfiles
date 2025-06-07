set number
set smarttab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set clipboard=unnamedplus
set ttimeoutlen=50
set encoding=utf-8
set cursorline
set cursorlineopt=number
syntax on

" vimplug
" look at: https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'nordtheme/vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'inkarkat/vim-ReplaceWithSameIndentRegister'
" \"+grR to paste from the clipboard (NORMAL)
" \"+gR to paste from the clipboard (VISUAL)
call plug#end()

" nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif " make nerdtree exit itself if it's the last window

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'nord'
set noshowmode

" colorscheme
set termguicolors
set guifont=Ubuntu\ Mono\ Nerd\ Font:h14
set fillchars=eob:\  " removes tilda characters at the end of the file
highlight WinSeparator guifg=#3b4252 guibg=NONE " changes the color of the separator
highlight CursorLineNr guifg=#d8dee9 guibg=NONE " changes the color of the numberline

" terminal
set splitbelow
