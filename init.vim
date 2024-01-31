" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'kana/vim-textobj-user'
Plug 'godlygeek/tabular'
Plug 'Vigemus/iron.nvim'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'skywind3000/asyncrun.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'GCBallesteros/vim-textobj-hydrogen'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"if has("syntax")
"  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"Set the shell, required to make xclip work
set shell=/bin/sh

syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=0
set number
set relativenumber
set cursorline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
colorscheme gruvbox

"Filetype support
filetype on 
filetype plugin on 
"Disable markdown cold folding
let g:vim_markdown_folding_disabled = 1

"Keybindings 
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map <C-f> :NERDTreeToggle<CR>
map <C-s> :set spell spellfile=~/.config/nvim/spell/wordlist.utf-8.spl

"Set up some Asyncrun commands
let g:asyncrun_open=6
"Set terminal for ipython setup
let g:slime_target = "neovim"
set splitbelow
set splitright
command! -nargs=* T split| resize 20 | terminal <args>

"Use netrw instead of NerdTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
noremap <silent> <C-t> :call ToggleNetrw()<CR>

"Disable cold folding in markdown plugin, and other options
let g:vim_markdown_folding_disabled=1

"Set default fortran type
let fortran_free_source=1

"Add open command
nnoremap gX :silent :execute
            \ "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>
 

map <S-u> <Nop>
inoremap <C-u> <Nop>

"calcurse commands
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
"hi Normal guibg=NONE ctermbg=NONE
"Some autocommands
"Clean up when Latex exits
autocmd VimLeave *.tex ! cleanLatex %:r

"Setup lua colorizer
set termguicolors
lua require'colorizer'.setup()

"Set up telescope 
lua require('telescope_settings')
nnoremap <silent> <C-g> <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-f> <cmd> Telescope find_files shorten_path=true<cr>
"
"Neomutt settings
autocmd BufNewFile,BufRead /tmp/neomutt* set noautoindent filetype=mail wm=0 tw=0 nonumber nolist
autocmd BufNewFile,BufRead ~/tmp/neomutt* set noautoindent filetype=mail wm=0 tw=0 nonumber  nolist

set mouse=

"Change from ctrl-w+key to ctrl-key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"iron.nvim
lua require('iron')
set formatoptions-=o
