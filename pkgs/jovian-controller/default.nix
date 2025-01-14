{ stdenv
, bundlerEnv
, ruby
, callPackage
}:
let
  gems = bundlerEnv {
    name = "Jovian-Controller-env";
    inherit ruby;
    gemdir  = src;
  };
  src = callPackage ./src.nix { };
in stdenv.mkDerivation {
  pname = "Jovian-Controller";

  inherit src;
  inherit (src) version;

  buildInputs = [
    gems
    gems.wrappedRuby
  ];

  installPhase = ''
    mkdir -p $out/libexec
    cp  -rvt $out/libexec \
      *.rb \
      lib
    # Add a ruby-based wrapper that launches the script with the right ruby.
    mkdir -p $out/bin
    cat <<EOF > $out/bin/Jovian-Controller
    #!${gems.wrappedRuby}/bin/ruby
    load(File.join(__dir__(), "..", "libexec", "jovian-controller.rb"))
    EOF
    chmod +x $out/bin/Jovian-Controller
  '';
}
