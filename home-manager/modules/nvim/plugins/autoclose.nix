{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.autoclose-nvim;
in {
  programs.neovim.plugins = [
    {
	    plugin = plugin;
	    config = ''
lua <<EOF
require("autoclose").setup({
  options = {
    disable_when_touch = true
  }
})
EOF
      '';
    }
  ];
}
