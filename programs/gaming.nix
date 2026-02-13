{ pkgs, ... }:
{
  # Controller driver
  hardware.xpadneo.enable = true;

  environment.systemPackages = with pkgs; [
    # PSX Emulation (Silent Hill)
    (retroarch.withCores (
      cores: with cores; [
        swanstation
      ]
    ))
  ];
}
