{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.transparent-nvim;
in {
  programs.neovim.plugins = [
    {
      plugin = plugin;
     	config = ''
lua <<EOF
require("transparent").setup({
  groups = { 
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {},
  exclude_groups = {},
})
EOF
	    '';
    }
  ];
}

