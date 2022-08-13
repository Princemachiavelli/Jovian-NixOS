{
  description = "Jupiter/SteamDeck compatible NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    lib-aggregate.url = "github:nix-community/lib-aggregate";
  };

  outputs = {self, nixpkgs, lib-aggregate}@inputs:
  {

    nixosModules.jovian = import ./modules;
    nixosModule = self.nixosModules.jovian;

    overlays.jovian = import ./overlay.nix;
    overlay = self.overlays.jovian;
  }; 

}
