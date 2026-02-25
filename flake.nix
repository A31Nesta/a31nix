{
  description = "A31Nesta's NixOS Configuration";

  inputs = {
    # Using unstable because of Quickshell and Noctalia lmao
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

    # Zen Browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Blender with CUDA (bin)
    # https://github.com/edolstra/nix-warez/blob/master/blender/flake.nix
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";

    # Dolphin Overlay
    # https://github.com/rumboon/dolphin-overlay
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
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

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.a31nesta = ./users/a31nesta/home.nix;
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
          modules = commonModules ++ hostModules ++ [ { networking.hostName = hostname; } ];
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
            # Engineer Gaming (main PC only)
            ./programs/gaming.nix
            # Vial
            ./programs/keyboard.nix

          ];
        };
        # Virtual machines
        a31nix-vm = mkHost {
          hostname = "a31nix-vm";
          hostModules = [
            ./computers/a31nix-vm-config.nix
          ];
        };
        # Old Laptop
        bos-s3 = mkHost {
          hostname = "bos-s3";
          hostModules = [
            ./computers/bos-s3-config.nix
          ];
        };
      };
    };
}
