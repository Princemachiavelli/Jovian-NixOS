{ fetchFromGitHub }:

let
  version = "0.1";
in (fetchFromGitHub {
  repo = "Jovian-Controller";
  owner = "Jovian-Experiments";
  rev = "669276f8e6be0ec1277a0c88c561357c65dbdfe0";
  sha256 = "sha256-vHsq7lQFjjUsSOa+Sbd2AVrLvEj70dcInC44eCYYtXY=";
}) // {
  inherit version;
}
