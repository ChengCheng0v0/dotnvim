{ lib', ... }:

{
  plugins.neogit = {
    enable = true;

    settings = {
      signs = {
        section = [
          "#"
          "&"
        ];
        item = [
          "+"
          "-"
        ];
        hunk = [
          "\""
          "'"
        ];
      };
    };
  };

  plugins.which-key.settings.spec =
    with lib'.utils.wk;
    with lib'.icons;
    [
      (mkSpec
        [
          "<leader>gg"
          { __raw = "function() require('neogit').open({ cwd = Utils.root() }) end"; }
        ]
        {
          desc = "Neogit";
          mode = modes.interact;
          icon = {
            icon = common.Neogit.line;
            color = "orange";
          };
        }
      )
    ];

  highlightOverride = {
    NeogitFloatBorder = {
      link = "WinSeparator";
    };
  };

  colorschemes.catppuccin.settings.integrations.neogit = true;
}
