
syntax enable

" Load vim-plug
"if empty(glob("~/.vim/autoload/plug.vim"))
"  execute 'mkdir -p ~/.vim/plugged'
"  execute 'mkdir -p ~/.vim/autoload'
"  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"endif
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'AlexJF/rename.vim', {'on': 'Rename' }

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
"Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

" Version control tool
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'plasticboy/vim-markdown', {'for': 'markdown' }
Plug 'mxw/vim-jsx'

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make % match xml tags
Plug 'edsono/vim-matchit', { 'for': ['xml', 'html'] }

" Make tab handle all completions
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionTyp     = '<C-n>'
let g:SuperTabCrMapping                = 0

" Syntastic: code linting errors
Plug 'scrooloose/syntastic'
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_config_file_enabled = 1

Plug 'Scuilion/gradle-syntastic-plugin'
Plug 'vim-scripts/vim-gradle'

" File browser
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
map <Leader>ff :NERDTree<CR>
map <silent><Leader>ffc :NERDTreeClose<CR>
" if has("autocmd")
"    autocmd vimenter * NERDTree
"    autocmd vimenter * if !argc() | NERDTree | endif
"    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e
"    autocmd vimenter * wincmd p
" endif

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
set hidden
set showtabline=0 "If you feel brave enough turn off tabline

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Add | symbol to indent line
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Dispatch command to Vim's quickfix window or Tmux's panel
Plug 'tpope/vim-dispatch'
let g:rspec_command = "Dispatch rspec {spec}"
Plug 'tpope/vim-surround'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"imap <Leader>sm <esc>a<Plug>snipMateNextOrTrigger
"smap <Leader>sm <Plug>snipMateNextOrTrigger

" Optional:
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" For html
Plug 'rstacruz/sparkup'

" Testing plug for rspec
Plug 'thoughtbot/vim-rspec'
map <Leader>rst :call RunCurrentSpecFile()<CR>
map <Leader>rss :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>

" Testing plug for many languages
Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
nmap <silent> <leader>mt :TestNearest<CR>
nmap <silent> <leader>mT :TestFile<CR>
nmap <silent> <leader>ma :TestSuite<CR>
nmap <silent> <leader>ml :TestLast<CR>
nmap <silent> <leader>mg :TestVisit<CR>

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rvm'
Plug 'claco/jasmine.vim'
Plug 'Raimondi/delimitMate'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'JalaiAmitahl/maven-compiler.vim'
Plug 'mikelue/vim-maven-plugin'
Plug 'majutsushi/tagbar'
map <F8> :TagbarToggle<CR>

filetype plugin indent on    " required

call plug#end()

syntax enable
set rnu
set nu
set numberwidth=4
set cpoptions+=n
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set foldenable
set foldlevel=2
set foldcolumn=2
set foldnestmax=2
set foldmethod=syntax
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
set cursorline

set grepprg=grep\ -nH\ $*
let g:tex_flavour = "latex"

set laststatus=2

set t_ut=
if $TERM == "xterm"
   set t_Co=256
endif

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" if has('gui_running')
"   set background=light
" else
"   set background=dark
" endif

"hi Normal ctermbg=none

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '..'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

" Change dir position to current opend file
map <silent><Leader>inst :PlugInstall<CR>
map <silent><Leader>lcd :lcd %:p:h<CR>
map <silent><Leader>ev :e $MYVIMRC<CR>
map <silent><Leader>cb :CtrlSpace<CR>
map <silent><Leader>gc :!google-chrome %<CR>
nmap <silent><Leader><CR> O<Esc>j
nmap <silent><CR> o<Esc>k
nmap <silent><Leader>sv :so $MYVIMRC<CR>

