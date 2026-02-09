{
  config,
  lib,
  lib',
  ...
}:

lib.mkIf config.plugins.snacks.enable {
  plugins.snacks.settings.toggle = {
    which_key = lib.mkIf (!config.plugins.which-key.enable) false;

    notify = true;

    icon = with lib'.icons.common; {
      enabled = ToggleOn.fill;
      disabled = ToggleOff.fill;
    };
    color = {
      enabled = "green";
      disabled = "yellow";
    };
    wk_desc = {
      enabled = "Disable ";
      disabled = "Enable ";
    };
  };

  autoCmd = [
    {
      group = "Lazy";
      desc = "Setup user settings feature";
      event = "VimEnter";
      callback.__raw = /* lua */ ''
        function()
          Snacks.toggle.dim():map('<leader>;D')
          Snacks.toggle.diagnostics():map('<leader>;d')
          Snacks.toggle.inlay_hints():map('<leader>;h')

          ${lib.optionalString config.plugins.gitsigns.enable /* lua */ ''
            local gs = require('gitsigns')
            local gs_config = require('gitsigns.config').config

            Snacks.toggle({
              name = "Current Line Blame";
              get = function()
                return gs_config.current_line_blame
              end,
              set = function(state)
                gs.toggle_current_line_blame(state)
              end
            }):map('<leader>;b')
          ''}
        end
      '';
    }
  ];
}
