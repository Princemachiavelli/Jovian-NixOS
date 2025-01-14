final: super:

let
  inherit (final)
    kernelPatches
    linuxPackagesFor
  ;
in
{
  acp5x-ucm = final.callPackage ./pkgs/acp5x-ucm { };
  linux-firmware = final.callPackage ./pkgs/linux-firmware {
    linux-firmware = super.linux-firmware;
  };
  linuxPackages_jovian = linuxPackagesFor final.linux_jovian;
  linux_jovian = super.callPackage ./pkgs/linux-jovian {
    kernelPatches = [
      kernelPatches.bridge_stp_helper
      kernelPatches.request_key_helper
      kernelPatches.export-rt-sched-migrate
    ];
  };
  linuxPackages_jovian_guest = linuxPackagesFor final.linux_jovian_guest;
  linux_jovian_guest = final.linux_jovian.override {
    guestSupport = true;
  };

  linuxPackages_jovian_5_17_guest = linuxPackagesFor final.linux_jovian_5_17_guest;
  linux_jovian_5_17_guest = final.linux_jovian_guest.override {
    kernelVersion = "5.17.0";
    vendorVersion = "valve1";
    githubVersion = "valve1";
    hash = "sha256-5x3DsN32xf6B0N/kDWvhOAUeMn6L6Ck5tO6725wxm68=";
  };
  gamescope = super.callPackage ./pkgs/gamescope {
    wlroots = super.wlroots_0_15;
  };
  gamescope-session = super.callPackage ./pkgs/gamescope-session { };

  jupiter-fan-control = final.callPackage ./pkgs/jupiter-fan-control { };

  jupiter-hw-support = final.callPackage ./pkgs/jupiter-hw-support { };
  steamdeck-hw-theme = final.callPackage ./pkgs/jupiter-hw-support/theme.nix { };
  steamdeck-firmware = final.callPackage ./pkgs/jupiter-hw-support/firmware.nix { };

  jovian-controller = final.callPackage ./pkgs/jovian-controller { };

  steamdeck-theme = final.callPackage ./pkgs/steamdeck-theme { };

  sdgyrodsu = final.callPackage ./pkgs/sdgyrodsu { };

  #TODO: add sc-controller with steamdeck support
}
