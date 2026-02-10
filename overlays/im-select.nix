final: prev:

{
  vimPlugins = prev.vimPlugins // {
    im-select = prev.vimUtils.buildVimPlugin {
      pname = "im-select.nvim";
      version = "0.1.0";

      src = prev.fetchFromGitHub {
        owner = "keaising";
        repo = "im-select.nvim";
        rev = "113a6905a1c95d2990269f96abcbad9718209557";
        hash = "sha256-rtbqJjih9yy2svMIro7FbdH9DqGTumAmfcRICfqT8tQ=";
      };

      meta = {
        homepage = "https://github.com/keaising/im-select.nvim";
      };
    };
  };
}
