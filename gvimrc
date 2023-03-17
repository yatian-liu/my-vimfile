" Source the example vimrc.
source $VIMRUNTIME/gvimrc_example.vim
" Override background color settings in gvimrc_example.vim
set background=light

" Custom configurations.

" settings about GUI appearance
set guioptions-=T  " no toolbar
set guioptions-=r  " no right scrollbar
set guifont=Source\ Code\ Pro\ 11
set lines=26 columns=84

" settings about different file types
" do not use autowrap (the -t option) for tex files
autocmd FileType tex setlocal textwidth=72 formatoptions-=t
autocmd FileType tex setlocal spell spelllang-=en spelllang+=en_us
autocmd FileType markdown setlocal tw=0 spell spelllang-=en spelllang+=en_us
autocmd FileType text setlocal tw=0 spell spelllang-=en spelllang+=en_us
" exclude CJK characters from spell checking
set spelllang+=cjk
" explicitly set spellfile
set spellfile=~/.vim/en.utf-8.add

" setting smart indentation when using soft wrap
" enable soft-wrap auto indentation
set breakindent
" detailed setting: leaving at least 40 characters per wrapped line
set breakindentopt=min:40

