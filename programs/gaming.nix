{ pkgs, ... }:
{
  # Controller driver
  hardware.xpadneo.enable = true;

  # Water (but gas)
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # PSX Emulation (Silent Hill)
    (retroarch.withCores (
      cores: with cores; [
        swanstation
      ]
    ))
    # Engineer Gaming
    mangohud
    protonup-qt
    lutris
    bottles
    heroic
  ];

  # I need this, my controller is kinda mappingless (in retroarch)
  nixpkgs.overlays = [
    # Stolen from here: https://wiki.nixos.org/wiki/RetroArch
    (final: prev: {
      retroarch-joypad-autoconfig = prev.retroarch-joypad-autoconfig.overrideAttrs {
        src = prev.fetchFromGitHub {
          owner = "a31nesta";
          repo = "retroarch-joypad-autoconfig";
          rev = "8e462b2c51d06cda352369ea7b2fa225cfd24078";
          hash = "sha256-hAuybdIl86ySSk3PmCihjC/jfgr1irSEZOPGYsjXDH8=";
        };
      };
    })
  ];
}
