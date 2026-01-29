{ inputs, pkgs, ... }:
{
  imports = [
    ./fzf-lua.nix
    ./image-nvim.nix
  ];

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

    keymaps = [
      {
        key = "<C-f>";
        mode = "i";
        silent = true;
        action = "<Right>";
      }
      {
        key = "<C-b>";
        mode = "i";
        silent = true;
        action = "<Left>";
      }
      {
        key = "<C-n>";
        mode = "i";
        silent = true;
        action = "<Down>";
      }
      {
        key = "<C-p>";
        mode = "i";
        silent = true;
        action = "<Up>";
      }
      {
        key = "<C-a>";
        mode = "i";
        silent = true;
        action = "<Home>";
      }
      {
        key = "<C-e>";
        mode = "i";
        silent = true;
        action = "<End>";
      }
      {
        key = "gl";
        mode = "n";
        silent = true;
        action = "$";
      }
      {
        key = "gh";
        mode = "n";
        silent = true;
        action = "^";
      }
    ];

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
        event = ["BufReadPre *.lean" "BufNewFile *.lean"];
      };
    };

    treesitter = {
      enable = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    lsp = {
      enable = true;
      lspSignature.enable = !autocomplete.blink-cmp.enable;
      servers.nixd.cmd = pkgs.lib.mkForce [ "nixd" ];
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        lsp.servers = ["nixd"];
      };
    };

    visuals = {
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
    
    mini = {
      # Text editing
      ai.enable = true;
      pairs.enable = true;
      surround.enable = true;

      # General workflow
      git.enable = true;
      jump.enable = true;
      jump2d.enable = true;

      # Appearance
      cursorword.enable = true;
      icons.enable = true;
      notify.enable = true;
    };

    binds = {
      whichKey.enable = true;
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
    };
  };
}
