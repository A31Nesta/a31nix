{ ... }:
{
  # Import all programs and desktop configs on the main PC
  imports = [
    ./presets/all.nix
  ];

  home.stateVersion = "25.05";
}
