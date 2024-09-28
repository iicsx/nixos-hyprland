{ pkgs, ... }: {
  home.packages = with pkgs; [
    glib
    w3m
    unzip
    zip
    gnutar
    bat
    fzf
  ];

  programs.ranger = {
      enable = true;
      settings = {
        preview_images = true;
        preview_images_method = "kitty";
      };
  };
}
