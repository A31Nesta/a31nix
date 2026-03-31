{ ... }:
{
  imports = [
    # Install the bare minimum for development (No entertainment/extras, no chatting)
    ../modules/programs/minimal.nix
    ../modules/programs/minimal-graphic.nix
    ../modules/programs/development.nix

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
