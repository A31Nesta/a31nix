{ pkgs, ... }:
{
  # Hardware Config
  imports = [
    ./a31nix-hardware.nix
  ];

  # Nvidia config in main PC only
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  # Eep mode
  hardware.nvidia.powerManagement.enable = true;
  # Wayland with Nvidia
  hardware.nvidia.modesetting.enable = true;

  # Maybe fixes eep mode for real this time??
  systemd.services.systemd-suspend.environment = {
    SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
  };

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  # State Version
  # -------------
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
