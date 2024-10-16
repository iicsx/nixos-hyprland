{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.undotree;
in {
  programs.neovim.plugins = [
    {
      plugin = plugin;
     	config = ''
lua <<EOF
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
EOF
	    '';
    }
  ];
}
