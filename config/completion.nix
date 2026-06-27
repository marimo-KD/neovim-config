{
  plugins = {
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = ["InsertEnter" "CmdlineEnter"];
      settings = {
        completion.list.selection = {
          preselect = false;
          auto_insert = true;
        };
      };
    };

    blink-pairs = {
      enable = true;
      lazyLoad.settings.event = ["BufReadPre"];
    };
  };
}
