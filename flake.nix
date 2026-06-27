{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      # inputs.nixpkgs.follows = "nixpkgs";
      # inputs.flake-parts.follows = "flake-parts";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, nixvim, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      imports = [ inputs.treefmt-nix.flakeModule ];
      perSystem =
        { system, pkgs, ... }:
        let
          configuration = nixvim.lib.evalNixvim {
            inherit system;
            modules = [ ./config ];
            extraSpecialArgs = {
              
            };
          };
        in
        {
          checks.default = configuration.config.build.test;
          packages.default = configuration.config.build.package;
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixd
            ];
          };
          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
            };
          };
        };
    };
}
