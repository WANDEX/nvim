-- Only required if you have packer configured as `opt`
vim.api.nvim_command('packadd packer.nvim')
vim.api.nvim_command('packadd vimball')

local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(x) == 1
end

local packer = require('packer')
local use = packer.use

packer.init {
  max_jobs = tonumber(vim.fn.system 'nproc') or 8,
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  },
}

packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  use { -- icons
    'kyazdani42/nvim-web-devicons', -- lua
  }

  -- visual
  use {'junegunn/limelight.vim', cmd='Limelight'}

  -- git
  use {
    'tpope/vim-fugitive',
    'jreybert/vimagit', -- till neogit is not fixed
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }

  use {
    'TimUntersberger/neogit',
    disable = true, -- FIXME throws error if enabled & setup{}
    requires = {'nvim-lua/plenary.nvim'},
  }

  use { -- format
    'ntpeters/vim-better-whitespace',
    'editorconfig/editorconfig-vim',
    'sbdchd/neoformat',
    'scrooloose/nerdcommenter',
  }

  use {
      'iamcco/markdown-preview.nvim',
      ft='markdown',
      run = function() vim.fn['mkdp#util#install']() end,
  }

  use { -- new text objects | more info: 'https://github.com/kana/vim-textobj-user/wiki'
    'kana/vim-textobj-user',    -- CORE plugin
    'glts/vim-textobj-comment', -- ac/ic aC
    'kana/vim-textobj-diff',    -- adh/idh
    'kana/vim-textobj-entire',  -- ae/ie
    'kana/vim-textobj-indent',  -- ai/ii aI/iI
    'kana/vim-textobj-line',    -- al/il
    {'bps/vim-textobj-python', ft='python'}, -- af/if ac/ic [pf/]pf [pc/]pc
  }

  use { -- motion
    'justinmk/vim-sneak',
    'christoomey/vim-sort-motion',
    'christoomey/vim-titlecase',
    'tpope/vim-surround',
    'tpope/vim-repeat',
  }

  use { -- syntax
    "justinmk/vim-syntax-extra",
    {'kovetskiy/sxhkd-vim', ft='sxhkd'},
  }

  use {
    'numirias/semshi',
    ft = 'python',
    run = ':UpdateRemotePlugins', -- FIXME: :UpdateRemotePlugins not runs automatically! call manually!
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- folding
  -- FIXME: locked -> to not try updating it. Till fix arrive (kalekundert/vim-coiled-snake/issues/33)
  use {'kalekundert/vim-coiled-snake', lock=true, ft='python'} -- python code folding
  use 'Konfekt/FastFold' -- remove default: 'zj', 'zk' movements -> breaks vim-sneak dz.. yz.. mappings!

  use { -- other
    'airblade/vim-rooter', -- auto cwd to the project root
    'voldikss/vim-translator',
    'mg979/vim-visual-multi',
    'mg979/vim-xtabline',
    'preservim/tagbar',
    'justinmk/vim-gtfo',
    'farmergreg/vim-lastplace',
  }

  use {'rmagatti/alternate-toggler', cmd='ToggleAlternate'} -- toggle alternate "boolean" values

  use 'moll/vim-bbye' -- wipe/delete buffers without closing windows or messing up layout.

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup{
        -- Exclusion Only makes sense if '*' is specified!
        '*'; -- Highlight all files, but customize some others.
        '!html'; -- Exclude from highlighting.
      }
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup{
        -- exclude: TODO somehow exclude floating_windows
        -- bufname_exclude = {''},
        buftype_exclude = {'nofile', 'terminal'}, -- :se bt
        filetype_exclude = {'man', 'help', 'packer'}, -- :se ft
        char_highlight_list = {
          "IndentGuidesOdd",
          "IndentGuidesEven",
        },
        show_trailing_blankline_indent = false,
      }
    end,
  }

  use {
    'Pocco81/TrueZen.nvim',
    config = function()
      require("true-zen").setup{
        modes = {
          ataraxis = {
            ideal_writing_area_width = { 80, 150, 0.53 },
          },
        },
      }
    end,
    cmd={'TZMinimalist', 'TZFocus', 'TZAtaraxis'},
  }

  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  }

  -- completion
  use 'neovim/nvim-lspconfig'   -- Collection of configurations for built-in LSP client
  use { -- cmp and sources
    "hrsh7th/nvim-cmp",         -- autocompletion plugin
    -- sources
    'hrsh7th/cmp-nvim-lsp',     -- LSP
    "hrsh7th/cmp-nvim-lua",     -- neovim's Lua runtime API such vim.lsp.*
    "hrsh7th/cmp-buffer",       -- buffer words
    "octaltree/cmp-look",       -- completing words in English $export WORDLIST="/usr/share/dict/dictname"
  }

  use {
    'ray-x/lsp_signature.nvim', -- show function signature
    config = function()
      require('lsp_signature').setup({
        bind = true,
        doc_lines = 5,
        floating_window = true,
        hint_enable = false,
        handler_opts = {border = "single"},
        extra_trigger_chars = {"(", ","},
      })
    end,
  }

  -- snippets
  use 'rafamadriz/friendly-snippets' -- Snippets collection
  use {
    'saadparwaiz1/cmp_luasnip', -- luasnip snippets cmp source
    requires = {
      'L3MON4D3/LuaSnip', -- snippets engine
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      'TC72/telescope-tele-tabby.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
  }

  -- at the end
  use 'neomake/neomake'
  use 'folke/which-key.nvim'

  -- THEMES (source file)
  --vim.api.nvim_command('luafile ~/.config/nvim/lua/user/themes.lua')
  require('user.pack.themes')

  -- STATUS BAR
  use 'rebelot/heirline.nvim'

  -- not sure (candidates for deletion):
  -- use 'metakirby5/codi.vim'
end)
