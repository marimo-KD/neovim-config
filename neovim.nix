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
      "blink.indent" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "blink.indent";
          pname = "blink.indent";
          src = inputs.blink-indent;
          nvimRequireCheck = "blink.indent";
        };
        setupModule = "blink.indent";
        event = ["BufReadPost" "BufNewFile"];
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
      enableTreesitter = true;

      nix = {
        enable = true;
        lsp.servers = ["nixd"];
      };
    };

    visuals = {
      fidget-nvim.enable = true;
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
      diff.enable = true;
      git.enable = true;

      # Appearance
      cursorword.enable = true;
      icons.enable = true;
      notify.enable = true;
    };

    binds.whichKey.enable = true;

    utility.motion.flash-nvim.enable = true;

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
    };
  };
}
