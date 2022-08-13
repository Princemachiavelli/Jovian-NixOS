{
  description = "Jupiter/SteamDeck compatible NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
    #lib-aggregate.url = "github:nix-community/lib-aggregate";
  };

  outputs = {self, nixpkgs, flake-utils, ... }@inputs:
  {
    nixosModules.jovian = import ./modules;
    nixosModule = self.nixosModules.jovian;

    overlays.jovian = import ./overlay.nix;
    overlay = self.overlays.jovian;
  } // (with flake-utils.lib; eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      };
    in rec {
      packages = {
        gamescope = pkgs.gamescope;
        acp5x-ucm = pkgs.acp5x-ucm;
        jupiter-fan-control = pkgs.jupiter-fan-control;
        linux-firmware = pkgs.linux-firmware;
        linux_jovian = pkgs.linux_jovian;
      };
    }));
}
