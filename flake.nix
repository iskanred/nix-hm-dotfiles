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
    { self, nixpkgs, home-manager, ... }:
    let
      hasLocal = builtins.pathExists ./local.nix;

      local =
        if hasLocal
        then import ./local.nix
        else null;

      mkHome = system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          modules = [
            self.homeModules.default
          ];

          extraSpecialArgs = {
            inherit local;
          };
        };
    in
    {
      # Reusable Home Manager module.
      # nix-darwin, NixOS, or another flake can import this.
      homeModules.default = ./home.nix;
    }
    // nixpkgs.lib.optionalAttrs hasLocal {
      # Standalone Home Manager configuration, available when local.nix exists.
      homeConfigurations.${local.username} = mkHome local.system;
    };
}
