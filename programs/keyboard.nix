{ pkgs, ... }:
{
  # Via Udev
  services.udev.packages = with pkgs; [
    qmk
    qmk-udev-rules
    qmk_hid
    via
    vial
  ];

  # Programs
  environment.systemPackages = with pkgs; [
    vial
  ];
}
