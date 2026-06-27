{
  filetype = {
    extension = {
      lean = "lean";
    };
  };
  plugins.lean = {
    enable = true;
    lazyLoad.settings.ft = ["lean"];
  };
  dependencies.lean.enable = false;
}
