{ lib, ... }:

let
  dir = ./.;
  excludes = [ ./default.nix ];
in
lib.composeManyExtensions (
  map import (
    builtins.filter (f: !(builtins.elem f excludes) && (lib.hasSuffix ".nix" (toString f))) (
      lib.filesystem.listFilesRecursive dir
    )
  )
)
