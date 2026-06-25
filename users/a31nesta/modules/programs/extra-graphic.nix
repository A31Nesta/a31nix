{ pkgs, ... }:
{
  # Entertainment and other non-essential graphics applications
  home.packages = with pkgs; [
    vlc
    # bitwarden-desktop # DEPENDS ON EOL ELECTRON: ISSUE: https://github.com/NixOS/nixpkgs/issues/526914
    affine
    feishin
  ];
}
