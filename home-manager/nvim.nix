{
  pkgs,
  lib,
  inputs,
  ...
}: {
  xdg = {
    # configFile.nvim.source = ../nvim;
    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${inputs.nvim-flake.packages.${pkgs.system}.default} %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };
  };

  programs.neovim.enable = true;
  home = {
    packages = with inputs; [
      inputs.nvim-flake.packages.${pkgs.system}.default
    ];
    sessionVariables = {
      EDITOR = "${inputs.nvim-flake.packages.${pkgs.system}.default}";
      VISUAL = "${inputs.nvim-flake.packages.${pkgs.system}.default}";
    };
  };

  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;

  #   withRuby = true;
  #   withNodeJs = true;
  #   withPython3 = true;

  #   extraPackages = with pkgs; [
  #     git
  #     gcc
  #     glibc
  #     jdk
  #     gnumake
  #     unzip
  #     wget
  #     curl
  #     tree-sitter
  #     ripgrep
  #     fd
  #     fzf
  #     cargo
  #     python3

  #     nil
  #     prettierd
  #     lua-language-server
  #     stylua
  #     alejandra
  #   ];
  # };
}
