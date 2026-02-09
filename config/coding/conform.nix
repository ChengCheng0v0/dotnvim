{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
      };

      formatters = {
        injected = {
          options = {
            ignore_errors = true;

            lang_to_ext = {
              bash = "sh";
              python = "py";
              rust = "rs";
              go = "go";
              javascript = "js";
              typescript = "ts";
              markdown = "md";
            };
          };
        };
      };
    };
  };
}
