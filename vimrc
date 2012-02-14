" =======================================
" Who: Jared Cugno based on Vim of Champions by Jeremy Mack 
" What: .vimrc
" Version: 1.0 (this may never change because who versions dot files,
" honestly)
"" From prev config
" :set formatoptions=qroctn2
" set wildmode=list:longest,full
" set pastetoggle=<Ins>
" " Folding commands (normal mode only
	" ,,l = loadview; ,,m = mkview
" :set viewdir=$HOME/.vim.view/
"	:autocmd BufWrite * mkview!
" :autocmd BufWinEnter *.* silent loadview
" set highlight=lub
" Repair weird terminal/vim settings
" :set backspace=start,eol,indent
" Todo: Needs TagList plugin and Gundo

" =======================================

" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
Bundle 'FuzzyFinder'
Bundle 'ZoomWin'
Bundle 'wincent/Command-T'
Bundle 'spiiph/vim-space'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mutewinter/LustyJuggler'
Bundle 'Gundo'
" UI Additions
Bundle 'scrooloose/nerdtree'
Bundle 'mutewinter/ir_black_mod'
Bundle 'godlygeek/csapprox'
Bundle 'Rykka/ColorV'
Bundle 'taglist.vim'
Bundle 'jcugno/all-colors-pack'
Bundle 'Lokaltog/vim-powerline'

" OS Integration
Bundle 'mkitt/browser-refresh.vim'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'jcugno/vim-phpunit'

" Automatic Helpers
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
" SnipMate
Bundle 'garbas/vim-snipmate'
" SnipMate Depedancies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
" Language Additions
Bundle 'jcugno/PIV'
Bundle 'vim-ruby/vim-ruby'
Bundle 'msanders/cocoa.vim'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'tpope/vim-rails'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'leshill/vim-json'
" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
" Debugging
Bundle 'DBGp-Remote-Debugger-Interface'


filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  set guifont=Menlo\ Regular:h12
  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------

" ---------------
" Color
" ---------------
set background=dark
set t_Co=256 " Ensure we have full spectrum of colors
set colorcolumn=80

" Conditionally Set colorscheme
if has('unix') && !has('gui_macvim')
  if $TERM == 'xterm-256color'
    " Neato, 256 color terminal. We can use ir_black_mod
    colorscheme molokai
  else
    " We can't use ir_black_mod :(
    set term=xterm
		set t_Co=256
		let g:CSApprox_verbose_level=0
    colorscheme molokai
  endif
else
  " We're good if not on unix or in MacVim
  colorscheme molokai
endif

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ---------------
" UI
" ---------------
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=2
set relativenumber " I think I like these more still but it may not exist


" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=1000        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=500     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set nofoldenable

" Use viminfo
set viminfo='100,f1,\"1000,:100,/100,h,%

" Remember settings between sessions
set viminfo='400,f1,"500,h,/100,:100,<500

let bash_is_sh=1 " this makes CLI integration better.

" ---------------
" Text Format
" ---------------
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set shiftwidth=2  " Tabs under smart indent
set cindent
set noexpandtab
set backspace=2
set encoding=utf-8

" Added 2005-03-23 Based on http://www.perlmonks.org/index.pl?node_id=441738
:set smarttab
:set shiftround
:set autoindent
:set smartindent

" ---------------
"  Modelines
" ---------------
set modeline
set modelines=4

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
set mousemodel=extend " Allow better terminal/mouse integration

" ---------------
" Scolling
" ---------------
set scrolljump=5
set scrolloff=3


" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Bindings
" ----------------------------------------

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Fixes common typos
command W w
command Q q

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" SVN blame for visual selection
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" This is for mouse scrolling (primarily in GVIM)
:map <M-Esc>[62~ <MouseDown>
:map! <M-Esc>[62~ <MouseDown>
:map <M-Esc>[63~ <MouseUp>
:map! <M-Esc>[63~ <MouseUp>
:map <M-Esc>[64~ <S-MouseDown>
:map! <M-Esc>[64~ <S-MouseDown>
:map <M-Esc>[65~ <S-MouseUp>
:map! <M-Esc>[65~ <S-MouseUp>

" Turn on "very magic" regex status by default for searches.
" :he /magic for more information
nnoremap / /\v
vnoremap / /\v

" Keybindings for movement in insert mode
imap <Leader>0 <Esc>I
imap <Leader>$ <Esc>A
imap <Leader>h <Esc>i
imap <Leader>l <Esc>lli
imap <Leader>j <Esc>lji
imap <Leader>k <Esc>lki

" Tab options (as in Vim GUI Tabs)
" <C-t> Opens a new tab
" Remember, gt goes to next tab, gT goes to previous; easier than using firefox
" control sequences
:nmap <C-t> :tabnew<CR>
:imap <C-t> <ESC>:tabnew<CR>
" :nmap <s-t> :tabclose<CR>
" :imap <C-> <ESC>:tabclose<CR>

" Map <leader>f to split horizontally, and move to bottom window
nnoremap <Leader>f <C-w>v<C-w>l

" ---------------
" Leader
" ---------------

" The escape key is a long ways away. This maps it to the sequence ';;'
:map! jj <esc>

nmap <silent> <leader>ss :set spell!<CR>
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>


" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" SuperTab
" ---------------
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" ---------------
" Neocachecompl
" ---------------
" let g:neocomplcache_enable_at_startup=0
" let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
" let g:neocomplcache_enable_cursor_hold_i=0
" let g:neocomplcache_cursor_hold_i_time=500
" let g:neocomplcache_auto_completion_start_length=1

" Tab / Shift-Tab to cycle completions
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
 let g:acp_enableAtStartup = 0 " disable AutoComplPop
 let g:neocomplcache_enable_at_startup = 1 " use neocomplcache
 let g:neocomplcache_max_list = 20
 let g:neocomplcache_max_keyword_width = 50
 let g:neocomplcache_max_menu_width = 15
 let g:neocomplcache_auto_completion_start_length = 2 " auto completion word length.
 let g:neocomplcache_manual_completion_start_length = 2 " manual completion word length.
 let g:neocomplcache_min_keyword_length = 3
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_enable_ignore_case = 1 " use ignorecase
 let g:neocomplcache_enable_smart_case = 1 " use Smartcase
 let g:neocomplcache_disable_auto_complete = 0 " if 1 to disable, can manual completion by <C-x><C-u>
 let g:neocomplcache_enable_wildcard = 1 " enable wildcard like *
 let g:neocomplcache_enable_cursor_hold_i = 1 " relative with updatetime event
 let g:neocomplcache_enable_auto_select = 1 " =1 -> AutoComplPop like behavior.
 let g:neocomplcache_enable_auto_delimiter = 0
 let g:neocomplcache_cursor_hold_i_time = 100 " completion time
 
 " ambiguous searching match
 let g:neocomplcache_enable_camel_case_completion = 0 " disable camel case completion.
 let g:neocomplcache_enable_underbar_completion = 0

 "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
 "function! s:check_back_space()"{{{
"	 let col = col('.') - 1
"	 return !col || getline('.')[col - 1] =~ '\s'
" endfunction"}}

"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"


" ---------------
" Lusty Juggler
" ---------------
if has('unix')
  " Allows for previous buffer on unix systems without most recent patch level
  " that enable LustyJuggler to work
  nnoremap <leader>, :e#<CR>
else
  nnoremap <leader>, :LustyJugglePrevious<CR>
end
let g:LustyJugglerShowKeys=1 " Show numbers for Lusty Buffers
let g:LustyJugglerSuppressRubyWarning=1

" Make Command / Alt 1-4 change to recent buffers in LustyJuggler

if has('ruby')
  if has('mac') || has('macunix') || has('gui_macvim')
    nmap <silent><D-1> :ruby LustyJ::profile() {$lusty_juggler.send('choose',2)}<CR>
    nmap <silent><D-2> :ruby LustyJ::profile() {$lusty_juggler.send('choose',3)}<CR>
    nmap <silent><D-3> :ruby LustyJ::profile() {$lusty_juggler.send('choose',4)}<CR>
    nmap <silent><D-4> :ruby LustyJ::profile() {$lusty_juggler.send('choose',5)}<CR>
  else
    nmap <silent><M-1> :ruby LustyJ::profile() {$lusty_juggler.send('choose',2)}<CR>
    nmap <silent><M-2> :ruby LustyJ::profile() {$lusty_juggler.send('choose',3)}<CR>
    nmap <silent><M-3> :ruby LustyJ::profile() {$lusty_juggler.send('choose',4)}<CR>
    nmap <silent><M-4> :ruby LustyJ::profile() {$lusty_juggler.send('choose',5)}<CR>
  endif
end

" ---------------
"  PHP Unit
" ---------------
let g:phpunit_srcroot = '/'
let g:phpunit_testroot = 'tests'
let g:phpunit_tests = g:phpunit_testroot
let g:phpunit_params = '--stop-on-failure --configuration tests/phpunit.xml'

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
endif
" ---------------
" Minibuffer Explorer
" ---------------
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" ---------------
" FuzzyFinder
" ---------------
let g:fuf_modesDisable=['mrucmd'] " Enables FufMruFile
nnoremap <silent><C-y> :FufMruFile<CR>
nnoremap <silent><C-u> :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fm :FufMruFile<CR>
nnoremap <leader>fb :FufBuffer<CR>

" ---------------
" NERDTree
" ---------------

" Auto open NerdTree if you didn't specifiy a file
autocmd vimenter * if !argc() | NERDTree | endif

" Lets you close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <silent><C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeClose<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=2
let NERDTreeBookmarksFile = $HOME . "/.NERDTreeBookmarks"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" ---------------
" Debugger 
" ---------------
let g:pathMap = '/mnt:/Users/jcugno/Documents/buzz_sites'

" ---------------
" Hex Highlight
" ---------------
command HexHighlight call HexHighlight()
nnoremap <leader>h :HexHighlight<CR>

" ---------------
" Command T
" ---------------
nnoremap <Leader>t :CommandT<CR>

" ---------------
" Tags
" ---------------
:set tags=$HOME/.vim.tags/
" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" These are tag files I've created; you may want to remove/change these for your
" own usage.
:call LoadTags("zf1")
:call LoadTags("pms-zend")
:call LoadTags("pms-dev")
:call LoadTags("buzz_cms")

" TagList options

nnoremap <silent> <F2> :TlistToggle<CR>

let Tlist_Use_Right_Window = 0
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1


" ---------------
" Indent Guides
" ---------------
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=5

if has('unix') && !has('gui_macvim')
  if $TERM == 'xterm-256color'
    " Make the guides smaller since they will be crazy visible in 256color mode
    let g:indent_guides_guide_size=1
  else
    " Turn off the guides when 256color mode isn't available
    let g:indent_guides_enable_on_vim_startup=0
  endif
endif

" ---------------
" Session
" ---------------
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" Browser Refresh
" ---------------
map <silent><leader>r :RRB<CR>
map <silent><F5> :RRB<CR>

" ---------------
" SpeedDating
" ---------------
let g:speeddating_no_mappings=1 " Remove default mappings (C-a etc.)
nmap <silent><leader>dm <Plug>SpeedDatingDown
nmap <silent><leader>dp <Plug>SpeedDatingUp
nmap <silent><leader>dn <Plug>SpeedDatingNowUTC

" ---------------
" Tabular
" ---------------
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ---------------
" Ack
" ---------------
:set grepprg=ack\ -a
:let g:ackprg="ack -H --nocolor --nogroup --column"

" ---------------
" snipMate
" ---------------
let g:snips_author = "Jared Cugno"


" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" OpenURL
" ---------------

if has('ruby')
ruby << EOF
  require 'open-uri'
  require 'openssl'
  
  def extract_url(url)
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]\{\};:'".,<>?«»“”‘’]))}

    url.match(re).to_s
  end

  def open_url
    line = VIM::Buffer.current.line

    if url = extract_url(line)
      if RUBY_PLATFORM.downcase =~ /(win|mingw)(32|64)/
        `start cmd /c chrome #{url}`
        VIM::message("Opened #{url}")
      else
        `open #{url}`
        VIM::message("Opened #{url}")
      end
    else
      VIM::message("No URL found on this line.")
    end

  end

  # Returns the contents of the <title> tag of a given page
  def fetch_title(url)
    if RUBY_VERSION < '1.9'
      open(url).read.match(/<title>(.*?)<\/title>?/i)[1]
    else
      open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read.match(/<title>(.*?)<\/title>?/i)[1]
    end
  end

  # Paste the title and url for the url on the clipboard in markdown format: [Title](url)
  # Note: Clobbers p register
  def paste_url_and_title
    clipboard = VIM::evaluate('@+')
    url = extract_url(clipboard)
    if url and url.strip != ""
      puts "Fetching title"
      title = fetch_title(url)
      VIM::command "let @p = '[#{title}](#{url})'"
      VIM::command 'normal! "pp'
    else
      VIM::message("Clipboard does not contain URL: '#{clipboard[1..10]}'...")
    end
  end
EOF

" Open a URL
if !exists("*OpenURL")
  function! OpenURL()
    :ruby open_url
  endfunction
endif

command! OpenUrl call OpenURL()
nnoremap <leader>o :call OpenURL()<CR>

" ---------------
" Paste link with Title
" ---------------

" Open a URL
if !exists("*PasteURLTitle")
  function! PasteURLTitle()
    :ruby paste_url_and_title
  endfunction
endif

command! PasteURLTitle call PasteURLTitle()
map <leader>pt :PasteURLTitle<CR>

endif " endif has('ruby')

" ---------------
" Fix Trailing White Space
" ---------------
map <leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>

" put all this in your .vimrc or a plugin file. This seems to allow you to set
	" the same tab / space options in a file. Use with caution?
	command! -nargs=* Stab call Stab()
	function! Stab()
		let l:tabstop = 1 * input('set shiftwidth=')

		if l:tabstop > 0
			" do we want expandtab as well?
			let l:expandtab = confirm('set expandtab?', "&Yes\n&No\n&Cancel")
			if l:expandtab == 3
				" abort?
				return
			endif

			let &l:sts = l:tabstop
			let &l:ts = l:tabstop
			let &l:sw = l:tabstop

			if l:expandtab == 1
				setlocal expandtab
			else
				setlocal noexpandtab
			endif
		endif

		" show the selected options
		try
			echohl ModeMsg
			echon 'set tabstop='
			echohl Question
			echon &l:ts
			echohl ModeMsg
			echon ' shiftwidth='
			echohl Question
			echon &l:sw
			echohl ModeMsg
			echon ' sts='
			echohl Question
			echon &l:sts . ' ' . (&l:et ? '  ' : 'no')
			echohl ModeMsg
			echon 'expandtab'
		finally
			echohl None
		endtry
	endfunction

" Languages {

	" PHP syntax settings
	:let php_sql_query=1
	:let php_htmlInStrings=1
	:let php_folding=0
	:let php_parent_error_close=1
	:let php_parent_error_open=1
	:let php_noShortTags=0
	:let g:DisableAutoPHPFolding = 1


	" Run file with Ruby interpreter
	:autocmd FileType ruby noremap <C-M> :w!<CR>:!ruby %<CR>

	" JSLint (CTRL-L when in a JS file)
	:autocmd FileType javascript noremap <C-L> :!jshint %<CR>

	" Skeleton (template) files...
	:autocmd BufNewFile *.html 0r $HOME/.vim/skeleton.html

	" Note: The "normal" command afterwards deletes an ugly pending line and moves
	" the cursor to the middle of the file.
	autocmd BufNewFile *.php 0r ~/.vim/skeleton.php | normal Gdd

	" syntax highlight pod in perl scripts
	let perl_include_pod=1
	let perl_extended_vars=1
	let perl_fold=1
	let perl_fold_blocks=1

	" .inc, phpt, phtml, phps files as PHP
	:autocmd BufNewFile,BufRead *.inc set ft=php
	:autocmd BufNewFile,BufRead *.phpt set ft=php
	:autocmd BufNewFile,BufRead *.phtml set ft=php
	:autocmd BufNewFile,BufRead *.phps set ft=php

" }

