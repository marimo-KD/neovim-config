{ inputs, pkgs, ...}:
{
  config.vim = {
    lazy.plugins = {
      "image.nvim" = {
        package = pkgs.vimPlugins.image-nvim;
        setupModule = "image";
        setupOpts = {
          backend = "kitty";
          max_height = 12;
          max_width = 50;
        };
        ft = ["markdown" "typst" "html" "css"];
      };
    };
    luaPackages = ["magick"];
  };
}
