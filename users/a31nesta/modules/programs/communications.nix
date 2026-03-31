{ pkgs, ... }:
{
  # Chatting apps, stuff related to communications
  home.packages = with pkgs; [
    fluffychat
    element-desktop
    telegram-desktop
  ];
}
