{ config, ... }: {
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = false;
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      julia
      json
      lua 
      markdown
      nix
      ocaml
      regex 
      toml
      typst
      vim
      vimdoc
      yaml
    ];
  };
}
