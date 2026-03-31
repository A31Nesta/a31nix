{ ... }:
{
  # Import all programs and desktop configs because why the heck not
  imports = [
    ./presets/all.nix
  ];

  home.stateVersion = "26.05";
}
