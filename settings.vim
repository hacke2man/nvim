" Nvim settings

syntax on
set nowrap
set relativenumber
set nu
set autoindent
set clipboard=unnamed
set colorcolumn=+80
hi ColorColumn ctermbg=darkgray
set expandtab
set incsearch
set scrolloff=8
set shiftround
set shiftwidth=4
set signcolumn=yes
set smarttab
set splitbelow
set noswapfile
set visualbell
set wildmenu
" complete
" completeopt
" fileformats
" guifont, guifontset
set matchpairs+=':'
set matchpairs+=":"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
