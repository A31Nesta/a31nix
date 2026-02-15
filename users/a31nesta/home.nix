{
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
    zed-editor
    nil
    nixd

    vlc
    bitwarden-desktop
    affine
    fluffychat
    element-desktop
  ];

  # Dark Theme in GTK
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 42;
  };

  # Git Config
  programs.git = {
    enable = true;
    settings = {
      user.name = "A31Nesta";
      user.email = "a31nesta@black.observer";
    };
  };

  # Default apps
  xdg = {
    enable = true;
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
        ];
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "zen.desktop";
        "text/x-shellscript" = "dev.zed.Zed.desktop";
        "application/x-shellscript" = "dev.zed.Zed.desktop";
      };
    };

    # Add Zed to Open Folder by adding "inode/directory"
    desktopEntries."dev.zed.Zed" = {
      name = "Zed";
      exec = "zeditor %U";
      icon = "zed";
      type = "Application";
      mimeType = [
        "inode/directory"

        "text/plain"
        "application/x-zerosize"
        "x-scheme-handler/zed"
      ];
      categories = [ "Development" ];
    };
  };
  # Stupid-ass dolphin fucking everything up
  home.file.".config/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop
  '';

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
