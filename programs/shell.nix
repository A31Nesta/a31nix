{ pkgs, ... }:
{
  # Aliases
  environment.shellAliases = {
    nrs = "nixos-rebuild switch --flake ~/.dotfiles/a31nix/";
    nfu = "nix flake update --flake ~/.dotfiles/a31nix/";
  };

  # Fihh config
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  # Fish plugins
  environment.systemPackages = with pkgs; [
    fishPlugins.pure
  ];
}
