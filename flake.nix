{
  description = "Mi configuracion de NixOS pa' Dell Chromebook 11 3180";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {
      cb113180 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./nixos/configuration.nix
          inputs.xremap-flake.nixosModules.default
          {
            services.xremap = {
              serviceMode = "system";
              withX11 = true;
              yamlConfig = (builtins.readFile ./keyboard/xremap.yaml);
            };
          }
        ];
      };
    };
  };

}
