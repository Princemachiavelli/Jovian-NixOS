{
  description = "NixOS on Steam Deck";

  inputs = {
    nixpkgs.url = "github:Princemachiavelli/nixpkgs/unstable-good";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      allowUnfree = true;
      overlays = [
        self.overlay
      ];
    };
  in {
    # Minimize diff while making `nix flake check` pass
    overlay = final: prev: (import ./overlay.nix) final prev;
    #packages.x86_64-linux = pkgs;
    packages.x86_64-linux = {
      #linux-firmware = pkgs.linux-firmware;
      linux_jovian = pkgs.linux_jovian;
      linux_jovian_5_17_guest = pkgs.linux_jovian_5_17_guest;
      gamescope = pkgs.gamescope;
      gamescope-session = pkgs.gamescope-session;
      #acp5x-ucm = pkgs.acp5x-ucm;

      #jupiter-fan-control = pkgs.jupiter-fan-control;

      jupiter-hw-support = pkgs.jupiter-hw-support;
      #steamdeck-hw-theme = pkgs.steamdeck-hw-theme;
      steamdeck-firmware = pkgs.steamdeck-firmware;
      jovian-controller = pkgs.jovian-controller;

      #steamdeck-theme = pkgs.steamdeck-firmware;

      #sdgyrodsu = pkgs.sdgyrodsu;
    };

    nixosModules.jovian = import ./modules;
  };
}
