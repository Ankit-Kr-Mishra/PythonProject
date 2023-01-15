{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs-2205.url = "github:NixOS/nixpkgs/nixos-22.05";
	};

	outputs = { self, nixpkgs, nixpkgs-2205, ... }: {
		packages = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ] (sys: let
			pkgs = nixpkgs: nixpkgs.legacyPackages.${sys};
		in {
			default = (pkgs nixpkgs).python3.withPackages (p: with p; [
				# add package names here e.g numpy
			]);
			mlEdge = (pkgs nixpkgs-2205).python3.withPackages (p: with p; [
				# add package names here e.g xgboost
			]);
		});
	};
}

