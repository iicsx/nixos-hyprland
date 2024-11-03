let
  name = "nex";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = name;
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
    delta = {
      enable = true;
      options = {
        navigate = true;    
        line-numbers = true;
        syntax-theme = "Monokai Extended";
      };
    };
    userEmail = "maxinies00@gmail.com";
    userName = name;
  };
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
  services.ssh-agent.enable = true;
}
