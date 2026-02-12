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
  services.hyprpolkitagent.enable = true;

  home.packages = with pkgs; [
    kitty
    kdePackages.qtsvg
    kdePackages.dolphin
    zed-editor
    nil
    nixd

    vlc
    bitwarden-desktop
  ];

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 42;
  };

  # Aliases
  home.shellAliases = {
    nrs = "nixos-rebuild switch --flake ~/.dotfiles/a31nix/";
    nfu = "nix flake update --flake ~/.dotfiles/a31nix/";
  };
  programs.bash.shellAliases = config.home.shellAliases;

  # Git Config
  programs.git = {
    enable = true;
    settings = {
      user.name = "A31Nesta";
      user.email = "a31nesta@black.observer";
    };
  };

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
