{
  description = "Home Manager configuration of elisr";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    # The machine-independent configuration, so that other flakes can build on it.
    homeModules.default = ./home.nix;

    homeConfigurations."e.roberts" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home.nix
        {
          # Home Manager needs a bit of information about you and the paths it should
          # manage.
          home.username = "e.roberts";
          home.homeDirectory = "/Users/e.roberts";
        }
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}
