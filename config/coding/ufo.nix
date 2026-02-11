{
  plugins.nvim-ufo = {
    enable = true;

    settings = {
      fold_virt_text_handler.__raw = "require('d.ufo_fold_virt_text_handler')";
    };
  };

  colorschemes.catppuccin.settings.integrations.ufo = true;
}
