{
  plugins.nvim-ufo = {
    enable = true;

    settings = {
      fold_virt_text_handler.__raw = "require('d.custom_ufo_fold_virt_text_handler')";
    };
  };

  colorschemes.catppuccin.settings.integrations.ufo = true;
}
