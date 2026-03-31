{ pkgs, ... }:
{
  # Add the OpenRGB
  environment.systemPackages = [
    pkgs.openrgb-with-all-plugins
  ];

  # And enable the service (adds UDEV rules, etc.)
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server.port = 6742;
  };
}
