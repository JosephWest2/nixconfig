{
    description = "System flake";
    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	nixvim.url = "github:nix-community/nixvim";
	nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { nixpkgs, nixpkgs-stable, home-manager, ... } @ inputs:
    let
	lib = nixpkgs.lib;
    in {
	nixosConfigurations = {
	    nixos = lib.nixosSystem rec {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [ 
		    ./configuration.nix 
		    home-manager.nixosModules.home-manager {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.extraSpecialArgs = { 
			    inherit inputs;
			    pkgs-stable = import nixpkgs-stable {
				inherit system;
				config.allowUnfree = true;
			    };
			};
			home-manager.users.josephw = import ./home.nix;
		    }
		];
	    };
	};
    };
}
