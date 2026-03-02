{
  description = "Home Manager configuration of iskanred";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      local = import ./local.nix;
      mkHome = system: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Pass local config to modules so home.nix doesn't import local.nix directly.
        extraSpecialArgs = { inherit local; };
      };
    in
    {
      homeConfigurations.${local.username} = mkHome local.system;
    };
}
