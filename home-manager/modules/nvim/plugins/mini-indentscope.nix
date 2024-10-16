{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.mini-indentscope;
in {
  programs.neovim.plugins = [
    {
      plugin = plugin;
     	config = ''
lua <<EOF
require('mini.indentscope').setup()
EOF'';
    }
  ];
}
