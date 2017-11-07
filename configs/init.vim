"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/bundles')
  call dein#begin('~/.config/nvim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

  " Add or remove your plugins here:
  " #plugins
  call dein#add('joshdick/onedark.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('othree/html5.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('mattn/emmet-vim')
  call dein#add('w0rp/ale')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('vimwiki/vimwiki')
  call dein#add('mhinz/vim-startify')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
	  call dein#add('roxma/nvim-yarp')
	  call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('terryma/vim-multiple-cursors')
  " #endplugins
 
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
  "call dein#install()
"endif

"End dein Scripts-------------------------

" #truecolor
"Use 2-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" #endtruecolor

" #funcs
"fu! SaveSess()
    "execute 'call mkdir(~/.config/nvim/.sessions)'
    "execute 'mksession! ~/.config/nvim/.sessions/session'
"endfunction

"fu! RestoreSess()
"execute 'so ~/.config/nvim/.sessions/session'
"execute 'so ~/.config/nvim/init.vim'
""if bufexists(1)
    ""for l in range(1, bufnr('$'))
        ""if bufwinnr(l) == -1
            ""exec 'sbuffer ' . l
        ""endif
    ""endfor
""endif
"endfunction

"autocmd VimLeave * call SaveSess()
"autocmd VimEnter * call RestoreSess()
" #endfuncs

" #settings 
filetype plugin on
set noacd
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_powerline_fonts = 1 
let g:comfortable_motion_no_default_key_mappings = 1
let g:goyo_width=120
let g:startify_change_to_dir = 0
"let g:user_emmet_leader_key='<leader>e'
let g:tagbar_autoshowtag = 1
colorscheme onedark
let g:airline_theme='onedark'
set showmatch " show matching brackets
set number " show numbers
set scrolloff=3
set ignorecase
set smartcase " case insensitive unless case is used in search
set gdefault " add g by default :s/foo/bar/g
set rnu " set relative numbers
set scroll=5
set timeoutlen=800
set wmh=0
set path+=**
let NERDTreeMapActivateNode='l'
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
" #endsettings


" #mappings
" SCROLLING
map ; :
map <Leader> <Plug>(easymotion-prefix)
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-e> 3<C-e> 
nnoremap <silent> <C-y> 3<C-y>
nnoremap <M-j> <C-e> 
nnoremap <M-k> <C-y> 
" WINDOW MANAGEMENT
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <c-h> <c-W>h
nmap <c-l> <c-W>l
nnoremap zz :vertical resize 
nnoremap <silent> <F3> :NERDTreeToggle<CR> 
map <S-F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <S-F3> :source ~/vim_session <cr>     " And load session with F3
map <C-p> :Denite file_rec buffer<cr>
nnoremap <CR> o<Esc>
nnoremap <C-o> O<Esc>
nnoremap <F12> :Goyo<CR>
nmap <silent> <Esc> :noh<CR> :TagbarClose<CR>
nmap <leader>r :so %<CR>
nmap <silent> <leader>t :TagbarToggle<CR>
nmap <silent> <F10> :TagbarToggle<CR>
nmap <leader>u :Dein update<CR>
nmap <leader>v :e ~/.config/nvim/init.vim<CR>
nmap <leader>3 :e ~/.i3/config<CR>
nmap <leader>b :Denite buffer<CR>
nmap <leader>p :echo expand('%')<CR>
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nmap gt <Plug>(easymotion-bd-f)
nmap gw <Plug>(easymotion-bd-w)
nmap gj <Plug>(easymotion-j)
nmap gk <Plug>(easymotion-k)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/  <<Plug>(incsearch-easymotion-stay)
map s/  <<Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
nmap <C-PageUp> :bp<CR>
nmap <C-PageDown> :bn<CR>
nmap <S-e> :bp<CR>
nmap <S-r> :bn<CR>
nmap <S-x> :bd<CR>
" #endmappings
