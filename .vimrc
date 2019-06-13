
set encoding=utf-8
syntax enable

" Load vim-plug
"if empty(glob("~/.vim/autoload/plug.vim"))
"  execute 'mkdir -p ~/.vim/plugged'
"  execute 'mkdir -p ~/.vim/autoload'
"  execute '!curl -fLo ~/.vim/autoload/plug.vim 
"  https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"endif
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" If installed using git
Plug '~/.fzf'

" Plug 'AlexJF/rename.vim', {'on': 'Rename' }

" Colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
"Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

" Version control tool
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-git', { 'for': 'git' }

" Syntax
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown' }
" Syntax highlighting and indenting for JSX. 
" JSX is a JavaScript syntax transformer which translates inline XML document fragments into JavaScript objects.
" Plug 'mxw/vim-jsx' 

" Completion
"Plug 'mattn/emmet-vim', { 'for': 'html' }
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<C-e>'

" Make % match xml tags
" Plug 'vim-scripts/matchit.zip' ", { 'for': ['xml', 'html'] }

" Make tab handle all completions
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionTyp     = '<C-n>'
let g:SuperTabCrMapping                = 0

" Syntastic: code linting errors
Plug 'scrooloose/syntastic'
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_scala = ['scalac']

" let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checkers = ['pylint']

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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'bak$', 'env$']

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
set hidden
set showtabline=0 "If you feel brave enough turn off tabline

" Fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:Powerline_symbols='unicode'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Add | symbol to indent line
"Plug 'Yggdroot/indentLine'
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '│'

" Dispatch command to Vim's quickfix window or Tmux's panel
Plug 'tpope/vim-dispatch'
" A vim script to send portion of text from a vim buffer to a
" running tmux session.
Plug 'jgdavey/tslime.vim'
Plug 'benmills/vimux'
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
" Plug 'othree/html5'

" Testing plug for rspec
Plug 'thoughtbot/vim-rspec'
map <Leader>rst :call RunCurrentSpecFile()<CR>
map <Leader>rss :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>

" Testing plug for many languages
Plug 'janko-m/vim-test'
let test#strategy = "tslime" " vimux, tslime, dispatch
nmap <silent> <leader>mt :TestNearest<CR>
nmap <silent> <leader>mT :TestFile<CR>
nmap <silent> <leader>ma :TestSuite<CR>
nmap <silent> <leader>ml :TestLast<CR>
nmap <silent> <leader>mg :TestVisit<CR>

let test#python#runner = 'pytest'
" Runners available are 'pytest', 'nose', 'nose2', 'djangotest', \
" 'djangonose' and Python's built-in 'unittest'

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

Plug 'chase/vim-ansible-yaml'
Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jaxbot/browserlink.vim'
au InsertLeave *.css :BLReloadCSS
au InsertLeave *.html :BLReloadPage
au InsertLeave *.py :BLReloadPage

" Plug 'ronakg/quickr-preview.vim'
" let g:quickr_preview_keymaps = 0
" Plug 'shime/vim-livedown'
" nmap gm :LivedownToggle<CR>
"
Plug 'hashivim/vim-vagrant'

" For Python
Plug 'plytophogy/vim-virtualenv'
Plug 'python-mode/python-mode'
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
Plug 'python-rope/ropevim'
let g:pymode_rope_autoimport = 0

" Plug 'nvie/vim-flake8'
" autocmd FileType python map <buffer> <Leader>b :call Flake8()<CR>

Plug 'jvanja/vim-bootstrap4-snippets'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" Plug 'w0rp/ale'
" let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
" Prettier settings
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

Plug 'elzr/vim-json'

" Plug 'ternjs/tern_for_vim'

" Preview Markdown plugin
" Plug 'suan/vim-instant-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome='/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'

"Plug 'JamshedVesuna/vim-markdown-preview'
"let vim_markdown_preview_hotkey='<C-m>'
" autocmd BufEnter *.md exe 'noremap <F5> :!/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %'

Plug 'posva/vim-vue'
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" CSS plugin
Plug 'ap/vim-css-color'

Plug 'derekwyatt/vim-scala'
Plug 'gre/play2vim'


Plug 'vim-scripts/nginx.vim'
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf if &ft == '' | setfiletype nginx | endif

Plug 'benmills/vimux'
" Run the current file with pytest
map <Leader>ptc :call VimuxRunCommand("clear; pytest " . bufname("%"))<CR>"
" Run the current folder with pytest
map <Leader>pt :call VimuxRunCommand("clear; pytest")<CR>"

Plug 'metakirby5/codi.vim'
" Plug 'jpalardy/vim-slime'
" let g:slime_target = "tmux"

Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-peekaboo'
Plug 'Yilin-Yang/vim-markbar'
nmap <Leader>m <Plug>ToggleMarkbar
" the following are unneeded if ToggleMarkbar is mapped
nmap <Leader>mo <Plug>OpenMarkbar
nmap <Leader>mc <Plug>CloseMarkbar
" g, t to 'go to' a mark
let g:markbar_jump_to_mark_mapping = 'gt'
" Ctrl-r, d to rename a mark
let g:markbar_rename_mark_mapping = '<C-r>d'
" Backspace to clear a mark's name
let g:markbar_reset_mark_mapping = '<BS>'

filetype plugin indent on    " required

call plug#end()

syntax enable
set nu rnu "number and relativenumber, turn hybrid line numbers on
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
set showcmd " show command in bottom bar"
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]}
set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

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
if has('gui_running')
  set background=light
else
  set background=dark
endif

"hi Normal ctermbg=none

"enable 256 colors in ConEmu on Win 
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD) 
  set term=xterm 
  set t_Co=256 
  let &t_AB="\e[48;5;%dm" 
  let &t_AF="\e[38;5;%dm" 
endif


set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '..'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.pycache

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

" Change dir position to current opend file
map <silent><Leader>inst :PlugInstall<CR>
map <silent><Leader>lcd :lcd %:p:h<CR>
map <silent><Leader>erc :e $MYVIMRC<CR>
map <silent><Leader>src :sp $MYVIMRC<CR>
map <silent><Leader>vrc :vsp $MYVIMRC<CR>
map <silent><Leader>cb :CtrlSpace<CR>
map <silent><Leader>gc :!google-chrome %<CR>
nmap <silent><Leader><CR> O<Esc>j
nmap <silent><Leader>\<CR> o<Esc>k
nmap <silent><Leader>sv :so $MYVIMRC<CR>
      
" Change window in quick way
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
" If you didn't do any resizing between the creation of the vertical split and
" <C-w>|, <C-w>= will return you to an "equalized" layout.
set wmw=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>
map <C-L> <C-W>l<C-W>
"
nmap <leader>p <plug>(quickr_preview)
nmap <leader>q <plug>(quickr_preview_qf_close)
             
" buffer mapping
map <leader>bd :bd<CR>
" If you are careful with your buffer list, you can use :sball and :tab sball 
" to open in windows or tabs, respectively.
map <leader>sb :sball<CR>
map <leader>tsb :tab sball<CR>
map bn  :bnext<CR>
map bp  :bprev<CR>

map h] <C-]>

" map <Leader>P :w!<CR>:w!/d/James/tmp/vim-markdown.md<CR>:!pandoc -s -f 
" markdown -t html -o /d/James/tmp/vim-markdown.html 
" /d/James/tmp/vim-markdown.md<CR>:!chrome % > /dev/null 2> /dev/null&<CR><CR>
" map <Leader>P :w!<CR>:!chrome % > /dev/null 2> /dev/null&<CR><CR>
" autocmd BufWritePost *.md :!chrome % > /dev/null 2> /dev/null&<CR><CR>
" autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map 
" <Leader>p :!start chrome "%:p"<CR>
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" Using the autocmd method, you could customize when the directory change
" takes place. For example, to not change directory if the file is in /tmp
" Ref. http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif


