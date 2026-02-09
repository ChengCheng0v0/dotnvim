{
  autoCmd = [
    {
      group = "Auto";
      event = "CmdlineEnter";
      pattern = "*";
      callback.__raw = /* lua */ ''
        function()
          vim.w.pre_cmdline_relativenumber = vim.opt_local.relativenumber:get()

          if vim.opt_local.relativenumber:get() then
            vim.opt_local.relativenumber = false
            vim.cmd.redraw()
          end
        end
      '';
    }

    {
      group = "Auto";
      event = "CmdlineLeave";
      pattern = "*";
      callback.__raw = /* lua */ ''
        function()
          if vim.w.pre_cmdline_relativenumber ~= nil then
            vim.opt_local.relativenumber = vim.w.pre_cmdline_relativenumber
            vim.w.pre_cmdline_relativenumber = nil
          end
        end
      '';
    }
  ];
}
