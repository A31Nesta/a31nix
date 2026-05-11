{
  description = "A31Nesta's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Quickshell and Noctalia
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland (latest)
    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland.url = "github:hyprwm/Hyprland";

    # Zen Browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Dolphin Overlay
    # https://github.com/rumboon/dolphin-overlay
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    # Solaar, for Logitech mice (swapping DPI and Middle Click buttons to make middle click last longer)
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      commonModules = [
        # Common config
        ./configuration.nix
        # Noctalia, Zen, Blender...
        ./programs/flake-general.nix

        # Dolphin Overlay
        { nixpkgs.overlays = [ inputs.dolphin-overlay.overlays.default ]; }

        # OVERLAY TO MAKE LDAP WORK, REMOVE LATER!
        {
          nixpkgs.overlays = [
            (_: prev: {
              openldap = prev.openldap.overrideAttrs {
                doCheck = !prev.stdenv.hostPlatform.isi686;
              };
            })
          ];
        }
      ];

      # Function to create a host by only focusing on the different files per host
      mkHost =
        {
          hostname,
          hostModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules =
            # Add common configs
            commonModules
            ++
              # Plus the per-device Home Manager configuration
              [
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.a31nesta = ./users/a31nesta/${hostname}-home.nix;
                }
              ]
            ++
              # Plus the modules that are specific to that host
              hostModules
            ++
              # Plus a small config to set the hostname
              [ { networking.hostName = hostname; } ];
        };
    in
    {
      nixosConfigurations = {
        # Main system
        a31nix = mkHost {
          hostname = "a31nix";
          hostModules = [
            # Device-specific configuration
            ./computers/a31nix-config.nix
            # Engineer Gaming
            ./programs/gaming.nix
            # Vial
            ./programs/keyboard.nix
            # OpenRGB
            ./programs/openrgb.nix
            # Maybe it's actually stable in NixOS
            ./programs/hyprland.nix
            # Embedded development
            ./programs/embedded.nix
            # Slop Generator
            ./programs/slop.nix

            # My fucking computer is dying, what the fuck
            ./programs/imploding.nix

            # Solaar configuration
            inputs.solaar.nixosModules.default
            ./programs/solaar.nix
          ];
        };
        # Laptop configuration, same same but different config
        a31rye = mkHost {
          hostname = "a31rye";
          hostModules = [
            ./computers/a31rye-config.nix
            ./programs/gaming.nix
            ./programs/keyboard.nix
            ./programs/hyprland.nix
            ./programs/embedded.nix
          ];
        };
      };
    };
}
