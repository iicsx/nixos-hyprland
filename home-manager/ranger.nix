{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    glib
    unzip
    zip
    gnutar
    bat
    fzf
  ];

  programs.ranger = {
    enable = true;
    settings = {
      show_hidden = true;
      preview_images = true;
      preview_images_method = "kitty";
    };
    extraConfig = ''
      default_linemode devicons
    '';
    plugins = [
      {
          name = "ranger_devicons";
          src = builtins.fetchGit {
            url = "https://github.com/alexanderjeurissen/ranger_devicons.git";
          };
        }
    ];
  };
}

