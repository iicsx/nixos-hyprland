vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- git
  use('tpope/vim-fugitive')

  -- Tree Sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/nvim-treesitter-context', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use('windwp/nvim-ts-autotag')

  -- File Management
  use('theprimeagen/harpoon')
  use("stevearc/oil.nvim")
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Undotree
  use('mbbill/undotree')

  -- Themes
  use('nyoom-engineering/oxocarbon.nvim')
  use('roflolilolmao/oceanic-next.nvim')
  use('AlexvZyl/nordic.nvim')
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "moon",
      })
    end,
  })

  -- Visual
  use("HiPhish/rainbow-delimiters.nvim")
  use('echasnovski/mini.indentscope')
  use('nvim-tree/nvim-web-devicons')
  use('xiyaowong/transparent.nvim')
  use('lewis6991/gitsigns.nvim')
  use('romgrk/barbar.nvim')
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- Formatting
  use('elentok/format-on-save.nvim')
  use('MunifTanjim/prettier.nvim')
  use('m4xshen/autoclose.nvim')
  use('alvan/vim-closetag')

  -- Linting
  use("danarth/sonarlint.nvim")

  -- Markdown
  use({
    'MeanderingProgrammer/markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('render-markdown').setup({})
    end,
  })

  -- Code Completion
  use('Exafunction/codeium.vim')

  -- MISC --
  use('andweeb/presence.nvim')
  use("diepm/vim-rest-console")
end)
