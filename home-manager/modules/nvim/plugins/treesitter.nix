{ pkgs, ... }:
let
  plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
in {
  programs.neovim.plugins = [
    plugin
  ];
}
