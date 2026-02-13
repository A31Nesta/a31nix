{
  pkgs,
  inputs,
  ...
}:
let
  sys = pkgs.stdenv.hostPlatform.system;
in
{
  environment.systemPackages = [
    inputs.noctalia.packages.${sys}.default
    inputs.zen-browser.packages.${sys}.default
  ];
}
