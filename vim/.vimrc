" +----------------------+
" | Bundle configuration |
" +----------------------+
set nocompatible  " disable vi compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

" >>> My Bundles here:
Bundle 'asmx86_64'
Bundle 'bling/vim-airline'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#ctrlp#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'
" let g:airline#extensions#whitespace#show_message = 1
" let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
" let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
" let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#tabline#enabled = 0


Bundle 'FencView.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'mru.vim'
Bundle '256-jungle'
Bundle 'scrooloose/nerdtree'

Bundle 'taglist.vim'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 1

Bundle 'Rip-Rip/clang_complete'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/'
" let g:clang_use_library = 1


Bundle 'nsf/gocode', {'rtp': 'vim'}
autocmd BufWritePre *.go Fmt
autocmd FileType go setlocal makeprg=go\ run\ %

Bundle 'Shougo/neocomplete.vim'
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:neocomplete#force_omni_input_patterns.objc =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:neocomplete#force_omni_input_patterns.objcpp =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'php'],
      \ 'passive_filetypes': ['puppet', 'html', 'nasm'] }
map <F9> <ESC>:SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_c_config_file = '.syntastic_c_config'



Bundle 'godlygeek/tabular'

Bundle 'PapayaWhip'
" a theme

Bundle 'DoxygenToolkit.vim'


Bundle 'VimIM'
let g:vimim_map='c-bslash'

Bundle 'mattn/emmet-vim'

Bundle 'jiangmiao/auto-pairs'

Bundle 'a.vim'

Bundle 'brookhong/cscope.vim'

" +---------+
" | Options |
" +---------+

" General
syntax on
filetype plugin indent on
set history=256
set autowrite  " Writes on make/shell commands
set autoread
set pastetoggle=<F10>
set scrolloff=4
set completeopt=menu,longest

" Modline
set modeline
set modelines=5

" Backup
set nowritebackup
set nobackup

" Search
set hlsearch
set smartcase
set incsearch

" Command line
set wildmenu
set wildmode=longest,list

" Formatting
set backspace=indent,eol,start

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
" set textwidth=78
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4

set autoindent
set cindent
" set cinoptions=
" set cinwords=

" Looking
set number
" set showmatch
" set matchtime=5
set novisualbell
set noerrorbells
set laststatus=2  " Always show the status line.
set vb t_vb=  " disable beeps
set ruler
set showcmd

set foldenable
set foldmethod=manual

if has('mouse')
  set mouse=a
endif

set mousehide

set splitbelow
set splitright

set guifont=Monaco\ for\ Powerline\ for\ Powerline:h13

if has('gui_running')
  colorscheme PapayaWhip
else
  colorscheme 256-jungle
endif


autocmd BufNewFile,BufRead *.m setlocal ft=objc
autocmd BufNewFile,BufRead *.asm,*.inc setlocal ft=nasm
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
