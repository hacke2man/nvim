" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'voldikss/vim-floaterm'
   	Plug 'SirVer/ultisnips'
   	Plug 'honza/vim-snippets'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'branch': 'release/0.x'
        \ }
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'morhetz/gruvbox'
    Plug 'mattn/emmet-vim'
    Plug 'unblevable/quick-scope'
    Plug 'ChristianChiarulli/far.vim'
    Plug 'mbbill/undotree'
    Plug 'matze/vim-move'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    
call plug#end()
