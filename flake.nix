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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # Main system
        a31nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # Common Configuration.nix
            ./configuration.nix
            # Device-specific configuration
            ./computers/a31nix-config.nix
            # Noctalia, Zen...
            ./flake-programs/general.nix

            # Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.a31nesta = ./users/a31nesta/home.nix;
            }
          ];
        };
        # Virtual machines
        a31nix-vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # Common Configuration.nix
            ./configuration.nix
            # Device-specific configuration
            ./computers/a31nix-vm-config.nix
            # Noctalia
            ./flake-programs/general.nix

            # Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.a31nesta = ./users/a31nesta/home.nix;
            }
          ];
        };
        # Old Laptop
        bos-s3 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # Common Configuration.nix
            ./configuration.nix
            # Device-specific configuration
            ./computers/bos-s3-config.nix
            # Noctalia
            ./flake-programs/general.nix

            # Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.a31nesta = ./users/a31nesta/home.nix;
            }
          ];
        };
      };
    };
}
