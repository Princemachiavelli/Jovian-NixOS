{ lib, stdenv, fetchFromGitHub, ncurses }:

stdenv.mkDerivation {
  pname = "sdgyrodsu";
  version = "1.14";

  src = fetchFromGitHub {
    owner = "zhaofengli";
    repo = "SteamDeckGyroDSU";
    rev = "8e767a618c435b76e6f445fad93ea817cca581a6";
    sha256 = "sha256-RG8aTyBGfzg5Zf3JcOIL8uEnUNX8spFhTfE/soZHUGU=";
  };

  buildInputs = [ ncurses ];

  makeFlags = [ "NOPREPARE=1" "release" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp -r bin/release/sdgyrodsu $out/bin

    runHook postInstall
  '';

  meta = with lib; {
    description = "Cemuhook DSU server for the Steam Deck Gyroscope";
    homepage = "https://github.com/kmicki/SteamDeckGyroDSU";
    license = licenses.mit;
  };
}
