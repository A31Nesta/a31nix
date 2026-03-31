{ pkgs, ... }:
{
  # The default app configuration requires having Zed, so we add it if we don't have it already (we should if we use minimal-graphic.nix)
  home.packages = with pkgs; [
    zed-editor
  ];

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
}
