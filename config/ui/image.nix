{
  plugins.image = {
    enable = true;

    luaConfig.pre = /* lua */ ''
      if #vim.api.nvim_list_uis() == 0 then
        package.preload['image'] = function()
          return {
            setup = function() end,
          }
        end
      end
    '';

    settings = {
      backend = "kitty";
    };
  };
}
