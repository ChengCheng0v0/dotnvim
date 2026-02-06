{ lib, ... }:

{
  extraConfigLuaPre = lib.mkBefore ''
    Utils = require('utils')

    Snacks = Utils.lazy_require('snacks.nvim')
  '';
}
