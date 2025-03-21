{
  description = "Configurations of nex";

  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    ...
  }: {
    packages.x86_64-linux.default =
      nixpkgs.legacyPackages.x86_64-linux.callPackage ./ags {inherit inputs;};

    # nixos config
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
        modules = [
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          {networking.hostName = "nixos";}
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:pneumaea/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-flake = {
      url = "github:pneumaea/nvim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    matugen.url = "github:InioX/matugen?ref=v2.2.0";
    ags.url = "github:Aylur/ags/v1";
    astal.url = "github:Aylur/astal";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };

    firefox-nebula-theme = {
      url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser";
      flake = false;
    };
  };
}
