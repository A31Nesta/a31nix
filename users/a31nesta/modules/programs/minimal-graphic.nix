{ pkgs, ... }:
{
  services.hyprpolkitagent.enable = true;

  # Essential / basic GUI applications
  home.packages = with pkgs; [
    kitty
    zed-editor

    qimgv
    grimblast
  ];
}
