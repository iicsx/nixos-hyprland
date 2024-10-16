{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    oxocarbon-nvim
  ];
}
