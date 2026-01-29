{ inputs, pkgs, config, ... }:
{
  enableMan = true;
  withNodeJs = false;
  withPerl = false;
  withPython3 = false;
  withRuby = false;

  clipboard.providers = {
    pbcopy.enable = pkgs.stdenv.isDarwin;
    wl-copy.enable = pkgs.stdenv.isLinux;
  };

  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
    combinePlugins.enable = false;
  };
  
  globalOpts = {
    number = true;
    relativenumber = true;

    termguicolors = true;

    signcolumns = "yes";

    mouse = "a";

    ignorecase = "true";
    smartcase = "true";

    splitright = "true";
    splitbelow = "true";

    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    expandtab = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
    smarttab = true;

    encoding = "utf-8";
    fileencoding = "utf-8";

    undofile = true;
    swapfile = true;
    backup = false;
    autoread = true;

    scrolloff = 5;
  };

  diagnostics = {
    update_in_insert = true;
    severity_sort = true;
    float.border = "rounded";
  };

  plugins = {
    
  };
}
