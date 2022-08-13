{
  description = "Jupiter/SteamDeck compatible NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs }:
  {

    nixosModules.jovian = import ./modules;
    nixosModule = self.nixosModules.jovian;

    overlay = import ./overlay.nix;
  };

}
