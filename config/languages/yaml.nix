{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettier
    yamllint
  ];

  plugins.lsp.servers.yamlls = {
    enable = true;
  };

  plugins.conform-nvim.settings.formatters_by_ft.yaml = [ "prettier" ];

  plugins.lint.lintersByFt.yaml = [ "yamllint" ];

  plugins.schemastore.yaml = {
    enable = true;
  };
}
