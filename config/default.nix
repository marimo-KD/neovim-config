{
  imports = [
    ./colorscheme.nix
    ./global.nix
    ./clipboard.nix
    ./completion.nix
    ./languages
  ];

  enableMan = false;
  withPython3 = false;
  withRuby = false;
  luaLoader.enable = true;
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
