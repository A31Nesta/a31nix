{ config, pkgs, inputs, ... }: {
	# imports = [ inputs.noctalia.homeModules.default ];

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

		vlc
		obsidian
	];

	home.file.".config/niri/config.kdl".source = ./config.kdl;
}
