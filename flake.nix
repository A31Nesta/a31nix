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
           	inputs.quickshell.follows = "quickshell";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.bos-s3 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                # import the previous configuration.nix
                ./configuration.nix
                # Noctalia
                ./noctalia.nix

                # Home Manager
                home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.a31nesta = ./a31nesta/home.nix;
                }
            ];
        };
    };
}
