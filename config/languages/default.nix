{
  imports = [
    ./treesitter.nix

    ./julia.nix
    ./lean.nix
    ./nix.nix
  ];
  plugins.lspconfig.enable = true;
}
