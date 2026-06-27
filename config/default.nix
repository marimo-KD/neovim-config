{
  imports = [
    ./colorscheme.nix
    ./options.nix
    ./clipboard.nix
    ./completion.nix
    ./picker.nix
    ./appearance.nix
    ./languages
  ];

  enableMan = false;
  withPython3 = false;
  withRuby = false;
  vimAlias = true;
  viAlias = true;

  luaLoader.enable = true;
  dependencies.python3.enable = false;
  dependencies.gcc.enable = false;
  plugins.lz-n.enable = true;
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
    combinePlugins.enable = false;
  };
}
