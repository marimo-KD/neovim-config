{
  config.vim = {
    fzf-lua = {
      enable = true;
      profile = "telescope";
      setupOpts = {
        ui_select = true;
      };
    };
    keymaps = [
      {
        key = "<leader>f";
        mode = "n";
        silent = true;
        action = "<cmd>FzfLua files<cr>";
      }
      {
        key = "<leader>b";
        mode = "n";
        silent = true;
        action = "<cmd>FzfLua buffers<cr>";
      }
    ];
  };
}
