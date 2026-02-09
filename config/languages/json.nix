{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettier
  ];

  plugins.lsp.servers.jsonls = {
    enable = true;
  };

  plugins.conform-nvim.settings.formatters_by_ft.json = [ "prettier" ];

  plugins.schemastore.json = {
    enable = true;
  };
}
