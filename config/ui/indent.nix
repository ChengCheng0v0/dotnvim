{
  config,
  lib,
  ...
}:

lib.mkIf config.plugins.snacks.enable {
  plugins.snacks.settings.indent = {
    enabled = true;

    indent = {
      enabled = true;
    };

    scope = {
      enabled = false;
      char = "│";
    };

    animate = {
      enabled = true;
      style = "out";
      easing = "linear";
      duration = {
        step = 16;
        total = 500;
      };
    };
  };
}
