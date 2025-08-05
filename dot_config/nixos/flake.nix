{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        home = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/home/configuration.nix
            ./modules/common.nix
            ./modules/nvidia.nix
            ./modules/programs/adb.nix
            ./modules/programs/fish.nix
            ./modules/programs/neovim.nix
            ./modules/services/display-manager.gnome.nix
            ./modules/services/xserver.nix
            ./users/sindre.nix
          ];
        };
        work = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/work/configuration.nix
            ./modules/common.nix
            ./modules/nvidia.nix
            ./modules/programs/adb.nix
            ./modules/programs/fish.nix
            ./modules/programs/neovim.nix
            ./modules/services/display-manager.gnome.nix
            ./modules/services/xserver.nix
            ./users/sindre.nix
          ];
        };
      };
    };
}
