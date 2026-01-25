{ inputs, pkgs, ... }:
{
  config.vim = rec {
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withNodeJs = false;
    withPython3 = false;

    options = {
      autoindent = true;
      shiftwidth = 0;
      tabstop = 2;
    };

    lazy.plugins = {
      "lean.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "lean.nvim";
          pname = "lean.nvim";
          src = inputs.lean-nvim;
          dependencies = [ pkgs.vimPlugins.plenary-nvim ];
          nvimRequireCheck = "lean";
        };
        setupModule = "lean";
        setupOpts = {
          mappings = true;
        };
      };
    };

    lsp = {
      enable = true;

      lspSignature.enable = !autocomplete.blink-cmp.enable;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    };

    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      indent-blankline.enable = true;
    };

    statusline.lualine = {
      enable = true;
      theme = "catppuccin";
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = false;
    };

    autocomplete.blink-cmp.enable = true;
    
    treesitter = {
      enable = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      context.enable = true;
      textobjects.enable = true;
    };


    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
      neogit.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    utility = {
      motion = {
        leap.enable = true;
      };
      images = {
        image-nvim = {
          enable = true;
          setupOpts = {
            backend = "kitty";
          };
        };
      };
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
    };
  };
}
