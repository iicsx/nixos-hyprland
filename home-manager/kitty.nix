{ pkgs, ... }: {
  programs.kitty = {
      enable = true;
      settings = {
        font = "CaskaydiaCove NF";
        enable_audio_bell = false;
        window_padding_width = 10;
        confirm_os_window_close = 0;
        background = "#171717";
        foreground = "#b2b5b3";
      };
  };
}
