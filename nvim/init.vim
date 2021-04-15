
"  ##############..... ##############   
    "##############......##############   
      "##########..........##########     
      "##########........##########       
      "##########.......##########        
      "##########.....##########..        
      "##########....##########.....      
    "..##########..##########.........    
  "....##########.#########.............  
    "..###################............    
      "################.............      
      "##############.JJJ.JJJJJJJJJJ      
      "############...JJ...JJ..JJ  JJ     
      "##########....JJ...JJ..JJ  JJ      
      "########......JJJ..JJJ JJJ JJJ     
      "######    .........                
                  ".....                  
                    ".                    
"	        	C O N F I G


set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set splitright
set splitbelow
set number
set relativenumber
set cmdheight=1
set mouse=a
set tabstop=4
set shiftwidth=4 
set ff=unix
set bg=dark
"****************************************************************************

call plug#begin("~/.vim/plugged")
" Themes
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'rafi/awesome-vim-colorschemes'
" Looks
  Plug 'preservim/nerdcommenter'
  Plug 'itchyny/lightline.vim'
  Plug 'MattesGroeger/vim-bookmarks'

" File Management
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git Clients
  Plug 'tpope/vim-fugitive'
  
" Working With Brackets 
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  
" HTML and JSX
  Plug 'alvan/vim-closetag'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript' 

" Auto Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css',  'coc-prettier', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-java', 'coc-python', 'coc-sh']

" FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
  Plug 'junegunn/fzf.vim'
  
" Code Correction
  Plug 'dmerejkowsky/vim-ale'

call plug#end()
"****************************************************************************

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

syntax on
colorscheme onedark

set guifont=Fira\ Code:h10 "h13 for neovide"

"****************************************************************************

let g:bookmark_sign = '=>'
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeMinimalUI = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:coc_config_file="$HOME/.config/coc/coc-settings.json"
let g:WebDevIconsTabAirLineAfterGlyphPadding='     '
let g:WebDevIconsTabAirLineBeforeGlyphPadding='     '

"NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js, *.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptytags_casesensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxregion,tsxregion',
    \ 'javascript.jsx': 'jsxregion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"****************************************************************************

let mapleader=","
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <F7> :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <F8> :e ~/.zshrc<CR>
nnoremap <silent> <F9> :e ~/.config/kitty/kitty.conf<CR>

nnoremap <A-Right> :tabnext<CR>
nnoremap <A-Left> :tabprev<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nmap <Space>j <Plug>BookmarkNext
nmap <Space>k <Plug>BookmarkPrev

" Turn terminal to normal mode with ESC
tnoremap <Esc> <C-\><C-n>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


"****************************************************************************

" Uncomment if you want to start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"****************************************************************************

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWinEnter * silent NERDTreeMirror

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


