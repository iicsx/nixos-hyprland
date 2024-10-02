{ ... }: let
  username = "nex";
in {
  systemd.tmpfiles.rules = [
    "d /home/${username}/source/notes"
    "d /home/${username}/source/repos"
    "d /home/${username}/source/setup"
  ];
}
