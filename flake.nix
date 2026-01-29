{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nvf = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lean-nvim = {
      url = "github:Julian/lean.nvim";
      flake = false;
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
    flake-parts.lib.mkFlake
      {
        inherit inputs;
      }
      {
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
            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};
            nixvimModule = {
              inherit system;
              module = import ./neovim.nix;
              extraSpecialArgs = {
                inherit inputs pkgs;
              };
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
          in
          {
            checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
            packages.default = nvim;
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
