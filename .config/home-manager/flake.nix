{
  description = "Home Manager configuration of elisr";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # Stable release branches: security and bug fixes only, much less churn than unstable.
    # Move both together to the next release (YY.05 / YY.11) when it comes out.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    # The machine-independent configuration, so that other flakes can build on it.
    homeModules.default = ./home.nix;

    homeConfigurations."elisr" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home.nix
        {
          # Home Manager needs a bit of information about you and the paths it should
          # manage.
          home.username = "elisr";
          home.homeDirectory = "/Users/elisr";
        }
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}
