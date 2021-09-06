"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.local/share/nvim/plugged')

"" format
"Plug 'brooth/far.vim' " didn't tried yet
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

"" visual
Plug 'jeffkreeftmeijer/vim-dim' " (Xresources) consistent term colors w invers
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'ap/vim-css-color'
Plug 'lilydjwg/colorizer'
Plug 'kabbamine/vcoolor.vim'
Plug 'machakann/vim-highlightedyank'

"" syntax
Plug 'kovetskiy/sxhkd-vim'
Plug 'mboughaba/i3config.vim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' } " python

Plug 'Valloric/ListToggle'
Plug 'metakirby5/codi.vim'

"" motion
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"" git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

"" advanced (other)
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'voldikss/vim-translator'
Plug 'mg979/vim-visual-multi' " This is awesome!
Plug 'farmergreg/vim-lastplace'
Plug 'justinmk/vim-gtfo'

" Plug 'dbeniamine/cheat.sh-vim'

"" python code folding
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

"" at the end
Plug 'neomake/neomake'

call plug#end()
