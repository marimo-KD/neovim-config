{ inputs, pkgs, config, ... }:
{
  enableMan = true;
  withNodeJs = false;
  withPerl = false;
  withPython3 = false;
  withRuby = false;
  luaLoader.enable = true;

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

    signcolumn = "yes";

    mouse = "a";

    ignorecase = true;
    smartcase = true;

    splitright = true;
    splitbelow = true;

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

  diagnostic.settings = {
    update_in_insert = true;
    severity_sort = true;
    float.border = "rounded";
  };

  colorscheme = "catppuccin";
  colorschemes.catppuccin = {
    enable = true;
    lazyLoad.enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        blink_cmp = {
          style = "bordered";
        };
        blink_indent = true;
        blink_pairs = true;
        mini.enabled = true;
        neogit = true;
      };
    };
  };

  filetype = {
    extension = {
      lean = "lean";
    };
  };

  plugins = {
    # Text editing
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = ["InsertEnter" "CmdlineEnter"];
    };
    mini-pairs.enable = true;
    mini-surround.enable = true;

    # General workflow
    mini-extra.enable = true;
    mini-git.enable = true;
    mini-jump = {
      enable = true;
    };
    mini-jump2d.enable = true;
    mini-pick = {
      enable = true;
    };
    neogit = {
      enable = true;
      lazyLoad.settings.cmd = "Neogit";
    };

    # Languages
    lean = {
      enable = true;
      lazyLoad.settings.ft = ["lean"];
    };
    treesitter = {
      enable = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    # Appearance
    blink-indent = {
      enable = true;
    };
    colorizer = {
      enable = true;
      lazyLoad.settings.event = ["BufReadPre"];
    };
    image = {
      enable = true;
      lazyLoad.settings.ft = ["markdown" "typst" "html" "css"];
      settings = {
        backend = "kitty";
        max_height = 12;
        max_width = 100;
        window_overlap_clear_enabled = true;
      };
    };
    lualine.enable = true;
    mini-cursorword.enable = true;
    mini-icons.enable = true;
    mini-notify.enable = true;
    noice.enable = true;
    which-key.enable = true;
  };
}
