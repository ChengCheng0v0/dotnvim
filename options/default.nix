{ lib, ... }:

{
  imports =
    let
      dir = ./.;
      excludes = [ ./default.nix ];
    in
    builtins.filter (f: !(builtins.elem f excludes) && (lib.hasSuffix ".nix" (toString f))) (
      lib.filesystem.listFilesRecursive dir
    );
}
