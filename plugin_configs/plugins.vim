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
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'unblevable/quick-scope'
    Plug 'neoclide/coc.nvim'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-sleuth'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'pacha/vem-tabline'
    Plug 'airblade/vim-rooter'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'Yggdroot/indentLine'
    Plug 'voldikss/vim-floaterm'
    Plug 'wincent/loupe'

call plug#end()
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-yank', 'coc-vimlsp',
                            \  'coc-ultisnips', 'coc-snippets', 'coc-prettier', 
                            \  'coc-marketplace', 'coc-gitignore', 'coc-emmet',
                            \  'coc-react-refactor']

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let g:UltiSnipsExpandTrigger='<C-e>'                
