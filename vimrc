" Get the defaults that most users want.
source $VIMRUNTIME/vimrc_example.vim

" Load sensible.vim early so we can override its settings.
runtime! plugin/sensible.vim

" Custom configurations.

set number " display line number

" Settings about tab and indentation.
set ts=4    " ts:tabstop, the length of a tab
set sw=4    " sw:shiftwidth, the length of one indent level
set expandtab  " expand a tab to ts spaces
" In front of a line, pressing tab inserts spaces, and backspace deletes
" sw spaces.
set smarttab

" For makefile, do not expand tab.
autocmd FileType make set noexpandtab ts=8 sw=8

" Enable ARM Assembly support.
autocmd BufNewFile,BufRead *.S set filetype=arm

" Set indentation width to 2 for scheme files.
autocmd FileType scheme setlocal shiftwidth=2

" Set encoding.
set encoding=utf-8

" Set color scheme to Solarized.
syntax enable
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Mappings to make movements operate on 1 screen line in wrap mode.
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
noremap <silent> <expr> j ScreenMovement("j")
noremap <silent> <expr> k ScreenMovement("k")
noremap <silent> <expr> 0 ScreenMovement("0")
noremap <silent> <expr> ^ ScreenMovement("^")
noremap <silent> <expr> $ ScreenMovement("$")

" If in visual break mode, do not break in the middle of words.
if &wrap
    set linebreak
    set nolist
endif

" Hidden instead of unload the current buffer when switch to another buffer.
set hidden

" Set a mapping to switch between buffers quickly.
nnoremap gb :ls<CR>:b<Space>

" Backup file only when writing.
set nobackup writebackup


" Settings for vimtex.

" Enable synctex.
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
\}

" Add 'paragraph' to folding sections.
let g:vimtex_fold_types = {
    \'sections' : {
    \    'sections' : [
    \        'part',
    \        'chapter',
    \        'section',
    \        'subsection',
    \        'subsubsection',
    \        'paragraph',
    \  ],
    \},
\}

" Enable folding on startup.
let g:vimtex_fold_enabled = 1
" Change fillup characters for folding to space.
set fillchars=fold:\ 

" Disable syntax concealing.
let g:vimtex_syntax_conceal_disable = 1

" Change the insert mode mapping leader.
let g:vimtex_imaps_leader = ';'

" Enable forward searching for Okular.
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" End of vimtex settings.


" Settings for easymotion.
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding `s{char}{label}.
nmap s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" End of easymotion settings.

" If in a wayland session, enable vim-wayland-clipboard.
if $WAYLAND_DISPLAY != ""
    packadd! vim-wayland-clipboard
endif
