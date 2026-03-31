{ pkgs, ... }:
{
  # Entertainment and other non-essential graphics applications
  home.packages = with pkgs; [
    vlc
    bitwarden-desktop
    affine
    feishin
  ];
}
