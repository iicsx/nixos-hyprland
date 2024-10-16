{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.yazi-nvim;
in {
  programs.neovim.plugins = [
    {
      plugin = plugin;
     	config = ''
lua <<EOF
require("yazi").setup()

vim.keymap.set("n", "<leader>fy", ":Yazi<CR>", { noremap = true })
EOF
	    '';
    }
  ];
}
