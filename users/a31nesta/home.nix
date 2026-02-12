{
  config,
  pkgs,
  ...
}:
{
  home.username = "a31nesta";
  home.homeDirectory = "/home/a31nesta";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    kitty
    kdePackages.qtsvg
    kdePackages.dolphin
    zed-editor
    nil
    nixd

    vlc
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "A31Nesta";
      user.email = "a31nesta@black.observer";
    };
  };

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
