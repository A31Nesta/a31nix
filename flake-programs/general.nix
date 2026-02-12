{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    inputs.zen-browser.packages.${system}.default
  ];
}
