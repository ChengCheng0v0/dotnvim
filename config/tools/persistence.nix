{ lib', ... }:

{
  plugins.persistence = {
    enable = true;

    settings = {
    };
  };

  plugins.which-key.settings.spec = with lib'.utils.wk; [
    (mkSpec
      [
        "<leader>qs"
        { __raw = "function() require('persistence').load() end"; }
      ]
      {
        desc = "Restore Session";
        mode = modes.interact;
      }
    )
    (mkSpec
      [
        "<leader>qS"
        { __raw = "function() require('persistence').select() end"; }
      ]
      {
        desc = "Select Session";
        mode = modes.interact;
      }
    )
    (mkSpec
      [
        "<leader>qd"
        { __raw = "function() require('persistence').stop() end"; }
      ]
      {
        desc = "Don't Save Current Session";
        mode = modes.interact;
      }
    )
  ];
}
