" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'unblevable/quick-scope'
    Plug 'neoclide/coc.nvim'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vim-which-key'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-sleuth'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let g:UltiSnipsExpandTrigger='<C-e>'                
