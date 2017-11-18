"shawncplus/phpcomplete.vihmdein Scripts-----------------------------
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
  call dein#add('sheerun/vim-polyglot')
  call dein#add('othree/html5.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('easymotion/vim-easymotion')
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
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('joeytwiddle/sexy_scroller.vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('SirVer/ultisnips')
  "call dein#add('Valloric/YouCompleteMe')
  call dein#add('honza/vim-snippets')
  call dein#add('wakatime/vim-wakatime')
  call dein#add('lfilho/cosco.vim')
  call dein#add('hlissner/vim-ultisnips-snippets')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tmhedberg/matchit')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('shawncplus/phpcomplete.vim')
  call dein#add('ap/vim-css-color')
  call dein#add('KabbAmine/vCoolor.vim')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('euclio/vim-markdown-composer')
  call dein#add('pangloss/vim-javascript')
  call dein#add('tpope/vim-eunuch')
  " #endplugins
 
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
fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()

set sessionoptions-=options  " Don't save options

if !isdirectory($HOME."/.config/nvim/undo")
    call mkdir($HOME."/.config/nvim/undo", "", 0700)
endif
set undodir=~/.config/nvim/undo
set undofile
"
"
" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
  let save_more = &more
  set nomore
  redir => lines
  silent execute a:cmd
  redir END
  let &more = save_more
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:filter)
    execute 'v/' . a:filter . '/d'
  endif
  0
endfunction
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists('g:deoplete#disable_auto_complete') 
	   let g:deoplete#disable_auto_complete = 1
	endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
	if exists('g:deoplete#disable_auto_complete')
	   let g:deoplete#disable_auto_complete = 0
	endif
endfunction
"#endfuncs

" #settings 
filetype plugin on
set noacd
set cursorline
"set cursorcolumn
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_powerline_fonts = 1 
let g:comfortable_motion_no_default_key_mappings = 1
let g:goyo_width=120
let g:startify_change_to_dir = 0
let g:deoplete#enable_at_startup = 1
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

let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack

set tabstop=4
set shiftwidth=4
set list lcs=tab:\|\ 
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let NERDTreeHijackNetrw = 0
"let g:auto_comma_or_semicolon = 1
"let g:cosco_filetype_whitelist = ['php', 'javascript', 'javascript.jsx', 'css']
set hidden
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsListSnippets        = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:multi_cursor_next_key = '<C-d>'
"let g:multi_cursor_prev_key = '<C-s-d>'
"let g:multi_cursor_skip_key = '<C-k>'
"g:multi_cursor_quit_key = '<'
"let g:vcoolor_lowercase = 1
set breakindent
let g:table_mode_corner='|'
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
" #endsettings


" #mappings
" SCROLLING
"map ; :
map <Leader> <Plug>(easymotion-prefix)
"nnoremap <silent> <C-s-n> :enew!<CR>
nnoremap <M-j> 3<C-e>
nnoremap <M-k> 3<C-y>
" WINDOW MANAGEMENT
map <M-u> gj
map <M-i> gk
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nmap <c-h> <c-W>h
nmap <c-l> <c-W>l
nnoremap zz :vertical resize 
nnoremap <silent> <F3> :NERDTreeToggle<CR> 
map <S-F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <S-F3> :source ~/vim_session <cr>     " And load session with F3
map <C-p> :Denite file_rec buffer<cr>
"map <C-r> :TagbarToggle<cr>
nnoremap <CR> o<Esc>
nnoremap <C-o> O<Esc>
nmap <silent> <F10> :TagbarToggle<CR>
nnoremap <F12> :Goyo<CR>
nmap <silent> <Esc> :noh<CR> :TagbarClose<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>t :TagbarToggle<CR>
nmap <leader>u :Dein update<CR>
nmap <leader>v :e ~/.config/nvim/init.vim<CR>
nmap <leader>i :e ~/.i3/config<CR>
nmap <leader>b :Denite buffer<CR>
nmap <leader>p :echo expand('%')<CR>
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nmap s <Plug>(easymotion-overwin-f)
nmap gw <Plug>(easymotion-bd-w)
nmap gj <Plug>(easymotion-j)
nmap gk <Plug>(easymotion-k)
map gl <Plug>(easymotion-lineforward)
map gh <Plug>(easymotion-linebackward)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/  <<Plug>(incsearch-easymotion-stay)
map s/  <<Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
nmap <C-PageUp> :bp!<CR>
nmap <C-PageDown> :bn!<CR>
nmap <S-e> <C-PageUp>
nmap <S-r> <C-PageDown> 
nmap <S-x> :bd!<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
map <C-_> <leader>c<space>
imap <C-_> <Esc><leader>c<space>i
autocmd FileType javascript,css,php nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,php imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
inoremap <leader>P <c-o>p
inoremap <leader>p <c-o>P
imap gll console.log()<Esc>==f(a
vmap gl cgll<Esc>p
imap gdd dd()<Esc>==f(a
imap gdu dump()<Esc>==f(a
nmap <leader>tt :TableModeToggle<CR>
map <C-a> <esc>ggVG<CR>
imap <C-Space> <C-X><C-O>
" #endmappings

" #commands
cnoreabbrev W w !sudo tee % > /dev/null
" #endcommands
