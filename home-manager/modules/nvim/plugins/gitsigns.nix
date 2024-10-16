{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.gitsigns-nvim;
in {
  programs.neovim.plugins = [
    {
    	plugin = plugin;
    	config = ''
lua <<EOF
require("gitsigns").setup()
EOF
	    '';
    }
  ];
}
