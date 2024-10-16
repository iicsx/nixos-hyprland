{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.tabline-nvim;
in {
  programs.neovim.plugins = [
    {
      plugin = plugin;
     	config = ''
lua <<EOF
require("tabline").setup()
EOF
	'';
    }
  ];
}

