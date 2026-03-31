{ ... }:
{
  imports = [
    # Install the bare minimum for a desktop
    ../modules/programs/minimal.nix
    ../modules/programs/minimal-graphic.nix

    # Add the dolphin fixes
    ../modules/dolphin.nix

    # Configure themes
    ../modules/theming.nix

    # Add Niri and Hyprland configurations
    ../modules/niri.nix
    ../modules/hyprland.nix
  ];
}
