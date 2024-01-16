{
  description = "Mi configuracion de NixOS pa' Dell Chromebook 11 3180";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    xremap-flake.url = "github:xremap/nix-flake";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, rust-overlay, ... }@inputs:
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
