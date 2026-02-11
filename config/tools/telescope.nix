{ lib', ... }:

{
  dependencies.ripgrep.enable = true;

  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      media-files = {
        enable = true;
        settings = {
          filetypes = [
            "png"
            "jpg"
            "jpeg"
            "webp"
          ];
          find_cmd = "rg";
        };
      };
    };

    settings = {
      defaults = with lib'; {
        sorting_strategy = "ascending";

        prompt_prefix = icons.prompt.Input.line + " ";
        selection_caret = icons.prompt.ListSelection.line + " ";

        create_layout.__raw = "require('d.telescope_layout')";

        mappings = {
          i = {
            "<esc>".__raw = "require('telescope.actions').close";
            "<C-j>".__raw = "require('telescope.actions').move_selection_next";
            "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
            "<C-d>".__raw = "require('telescope.actions').results_scrolling_down";
            "<C-u>".__raw = "require('telescope.actions').results_scrolling_up";
            "<C-f>".__raw = "require('telescope.actions').preview_scrolling_down";
            "<C-b>".__raw = "require('telescope.actions').preview_scrolling_up";
            "<A-n>".__raw = "require('telescope.actions').cycle_history_next";
            "<A-p>".__raw = "require('telescope.actions').cycle_history_prev";
          };
          n = { };
        };

        pickers = {
          find_files = {
            find_command = [
              "rg"
              "--files"
              "--color"
              "never"
              "-g"
              "!.git"
            ];
            hidden = true;
          };
        };
      };
    };
  };

  plugins.which-key.settings.spec =
    with lib'.utils.wk;
    with lib'.icons;
    let
      telescopeIcon = {
        icon = "󱡠";
        color = "azure";
      };
    in
    [
      (mkSpec
        [
          "<leader>ff"
          {
            __raw = "function() require('telescope.builtin').find_files({ cwd = Utils.root() }) end";
          }
        ]
        {
          desc = "Find Files (Root Dir)";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fF"
          {
            __raw = "function() require('telescope.builtin').find_files({ cwd = vim.uv.cwd() }) end";
          }
        ]
        {
          desc = "Find Files (cwd)";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fg"
          {
            __raw = "function() require('telescope.builtin').live_grep({ cwd = Utils.root() }) end";
          }
        ]
        {
          desc = "Live Grep (Root Dir)";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fG"
          {
            __raw = "function() require('telescope.builtin').live_grep({ cwd = vim.uv.cwd() }) end";
          }
        ]
        {
          desc = "Live Grep (cwd)";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fb"
          {
            __raw = "function() require('telescope.builtin').buffers({ sort_mru = true, sort_lastused = true }) end";
          }
        ]
        {
          desc = "Buffers";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fB"
          {
            __raw = "function() require('telescope.builtin').buffers() end";
          }
        ]
        {
          desc = "Buffers (all)";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fh"
          {
            __raw = "function() require('telescope.builtin').help_tags() end";
          }
        ]
        {
          desc = "Help Tags";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )
      (mkSpec
        [
          "<leader>fP"
          {
            __raw = "function() require('telescope').extensions.media_files.media_files() end";
          }
        ]
        {
          desc = "Help Tags";
          icon = telescopeIcon;
          mode = modes.interact;
        }
      )

      (mkSpec [ "<leader><space>" "<leader>ff" ] {
        desc = "Find Files (Root Dir)";
        icon = telescopeIcon;
        mode = modes.interact;
        remap = true;
      })
      (mkSpec [ "<leader>/" "<leader>fg" ] {
        desc = "Live Grep (Root Dir)";
        icon = telescopeIcon;
        mode = modes.interact;
        remap = true;
      })
      (mkSpec [ "<leader>," "<leader>fb" ] {
        desc = "Switch Buffer";
        icon = telescopeIcon;
        mode = modes.interact;
        remap = true;
      })
    ];

  colorschemes.catppuccin.settings.integrations.telescope = true;
}
