{
  description = "Jupiter/SteamDeck compatible NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs }:
  let
    agenix = system: nixpkgs.legacyPackages.${system}.callPackage ./pkgs/agenix.nix {};
  in {

    nixosModules.age = import ./modules;
    nixosModule = self.nixosModules.age;

    overlay = import ./overlay.nix;
  };

}
