{ pkgs, ... }:
{
  # Development applications
  home.packages = with pkgs; [
    nil
    nixd
    postman
  ];
}
