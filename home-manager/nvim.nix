{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nvim/init.nix
  ];
  xdg = {
    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # viAlias = true;
    # vimAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      git
      gcc
      glibc
      jdk
      gnumake
      unzip
      wget
      curl
      tree-sitter
      ripgrep
      fd
      fzf
      cargo
      python3

      nil
      prettierd
      lua-language-server
      stylua
      alejandra
    ];
  };
}
