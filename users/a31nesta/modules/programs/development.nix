{ pkgs, ... }:
{
  # Development applications
  home.packages = with pkgs; [
    nil
    nixd
    postman
  ];

  # Add visual studio code with PlatformIO - DISABLED, using Rust for the NEOS kernel and apps
  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscode.fhsWithPackages (ps: with ps; [ avrdude ]);
  # };
}
