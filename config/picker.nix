{
  plugins.fzf-lua = {
    enable = true;
    profile = "telescope";
    lazyLoad.settings.cmd = "FzfLua";
  };
  keymaps = [
    {
      action = "<cmd>FzfLua files<cr>";
      key = "<leader>f";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>FzfLua buffers<cr>";
      key = "<leader>b";
      mode = "n";
      options.silent = true;
    }
  ];
}
