{ lib', ... }:

{
  diagnostic = {
    settings = {
      severity_sort = true;
      signs = {
        text = with lib'.icons.diagnostic; {
          "__rawKey__vim.diagnostic.severity.HINT" = Hint.fill;
          "__rawKey__vim.diagnostic.severity.INFO" = Information.fill;
          "__rawKey__vim.diagnostic.severity.WARN" = Warning.fill;
          "__rawKey__vim.diagnostic.severity.ERROR" = Error.fill;
        };
      };
    };
  };
}
