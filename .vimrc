" ##############################################################################
" When .vimrc file is sourced twice, the autocommands will appear twice.
" To avoid this, define your autocommands in a group, so that you can
" easily clear them.
" ##############################################################################


" ##############################################################################
" Function Definition
" ##############################################################################

function! PackInit() abort
    packadd minpac
    call minpac#init({'verbose': 3, 'progress_open': 'none', 'status_open': 'vertical'})
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " menu & key binding
    call minpac#add('liuchengxu/vim-which-key')

    " themes
    call minpac#add('rakr/vim-one')
    call minpac#add('morhetz/gruvbox')
    call minpac#add('luochen1990/rainbow')
    call minpac#add('Yggdroot/indentLine')
    call minpac#add('itchyny/lightline.vim')

    " language pack
    call minpac#add('sheerun/vim-polyglot')

    " code comment
    call minpac#add('preservim/nerdcommenter')

    " code format
    call minpac#add('ntpeters/vim-better-whitespace')

    " multi cursor
    call minpac#add('mg979/vim-visual-multi')

    " misc
    call minpac#add('tpope/vim-endwise')
    call minpac#add('tpope/vim-eunuch')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-surround')
    call minpac#add('andymass/vim-matchup')
    call minpac#add('Konfekt/FastFold')
endfunction

function! PackList(...)
    call PackInit()
    return join(sort(keys(minpac#getpluglist())), "\n")
endfunction


" ##############################################################################
" Base Setting
" ##############################################################################

syntax on
filetype plugin indent on

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" fix gvim menu garbled
if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set showmatch

set number
se mouse+=a

" show the character '^M' of DOS format
set fileformats=unix


" ##############################################################################
" Custom Shortcut
" ##############################################################################
" insert blank-line in normal mode
nmap <C-j> o<ESC>k
nmap <C-k> O<ESC>j


" ##############################################################################
" Highlightt Search Setting
" ##############################################################################
set incsearch

augroup mygroup_incsearch
    " Clear all existing autocommands in this group
    autocmd!

    " uncomment the 'cursorhold' line to turn off search highlight after
    " timeout (X seconds, default: 5)
    " autocmd cursorhold * set nohlsearch
augroup end

noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
nnoremap <C-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc


" ##############################################################################
" which-key Setting
" ##############################################################################

highlight default link WhichKeySeperator Constant
let g:which_key_use_floating_win = 1
let g:which_key_floating_relative_win = 1
let g:mapleader = "\<Space>"
let g:maplocalleader = '\\'
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '\'<CR>

" nnoremap <silent> ]             :<c-u>WhichKey ']'<CR>
" nnoremap <silent> [             :<c-u>WhichKey '['<CR>

let g:which_key_map = {}

let g:which_key_map.c = {
    \ 'name': '+NerdCommenter',
    \ }

let g:which_key_map.g = {
    \ 'name': '+GitGutterToggle',
    \ }

let g:which_key_map.h = {
    \ 'name': '+GitGutterStageHunks',
    \ }

let g:which_key_map['['] = {
    \ 'name': '+[',
    \ 'w'   : ['[w', 'PrevTrailingWhiteSpace'],
    \ }

let g:which_key_map[']'] = {
    \ 'name': '+]',
    \ 'w'   : ['[w', 'NextTrailingWhiteSpace'],
    \ }

augroup mygroup_whichkey
    " Clear all existing autocommands in this group
    autocmd!

    autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
    " autocmd! FileType which_key
    " autocmd  FileType which_key set laststatus=0 noshowmode noruler
    "     \| autocmd  BufLeave <buffer> set laststatus=2 showmode ruler
augroup end


" ##############################################################################
" vim-color Setting
" ##############################################################################

" ------------------------------------------------------------------------------
" To using the transparent background, follow the step:
"   1) Comment the 'termguicolors' and 'background' settings
"   2) Enable highlight of group 'Normal'
" ------------------------------------------------------------------------------
set termguicolors
set background=dark
colorscheme one
" highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" custom color
highlight Visual ctermfg=NONE ctermbg=185 guifg=NONE guibg=#c6e497
highlight LineNr ctermfg=244 ctermbg=237 guifg=#878787 guibg=#2c3b50

set cursorline
highlight CursorLine ctermfg=NONE ctermbg=240 guifg=NONE guibg=#454545

set completeopt=menu,menuone

" ------------------------------------------------------------------------------
" for Dracula color theme, maybe need more debug
" ------------------------------------------------------------------------------
highlight PMenu ctermfg=78 ctermbg=240 guifg=#98fb98 guibg=#454545
highlight PMenuSel ctermfg=253 ctermbg=103 guifg=#e6e6e6 guibg=#8d9db2


" ##############################################################################
" rainbow Setting
" ##############################################################################

let g:rainbow_active = 1


" ##############################################################################
" indentLine Setting
" ##############################################################################

let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_color_term = 8
let g:indentLine_char = '│'


" ##############################################################################
" nerdcommenter Setting
" ##############################################################################

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1


" ##############################################################################
" vim-better-whitespace Setting
" ##############################################################################

set listchars=tab:>-

" set tabs visable
nnoremap <leader><F5> :ShowTabsToggle<CR>
command! ShowTabsToggle call ShowTabsToggle()
function! ShowTabsToggle()
    set list! list?
endfunc

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']

" navigate to the previous or next trailing whitespace
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>


" ##############################################################################
" FastFold Setting
" ##############################################################################

let g:c_fold = 1
let g:javaScript_fold = 1
let g:rust_fold = 1
let g:fastfold_minlines = 10

set foldmethod=syntax
set foldlevelstart=99


" ##############################################################################
" # Common Setting
" ##############################################################################

" ------------------------------------------------------------------------------
" Define user commands for updating/cleaning the plugins. Each of them calls
" PackInit() to load minpac and register the information of plugins, then
" performs the task.
" ------------------------------------------------------------------------------

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" Open a shell at the directory where a plugin is installed ==
command! -nargs=1 -complete=custom,PackList
    \ PackOpenDir call PackInit() | call term_start(&shell,
    \     {'cwd': minpac#getpluginfo(<q-args>).dir,
    \      'term_finish': 'close'})

" Open the repository of a plugin in a web browser ==
command! -nargs=1 -complete=custom,PackList
    \ PackOpenUrl call PackInit() | call openbrowser#open(
    \     minpac#getpluginfo(<q-args>).url)
