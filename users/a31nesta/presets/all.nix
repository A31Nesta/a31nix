{ ... }:
{
  imports = [
    # Install all programs
    ../modules/programs/minimal.nix
    ../modules/programs/minimal-graphic.nix
    ../modules/programs/extra-graphic.nix
    ../modules/programs/development.nix
    ../modules/programs/communications.nix
    ../modules/programs/artistic.nix

    # Configure Git for this user
    ../modules/git.nix

    # Add the dolphin fixes
    ../modules/dolphin.nix

    # Configure themes
    ../modules/theming.nix

    # Add Niri and Hyprland configurations
    ../modules/niri.nix
    ../modules/hyprland.nix
  ];
}
