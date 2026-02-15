{ lib, ... }:

{
  imports =
    let
      dir = ./.;
      excludes = [ ./default.nix ];
    in
    builtins.filter (
      f:
      !(builtins.elem f excludes)
      && (lib.hasSuffix ".nix" (toString f))
      && !(lib.hasPrefix "_" (builtins.baseNameOf (toString f)))
    ) (lib.filesystem.listFilesRecursive dir);

  extraFiles =
    let
      dir = ../lua;
      excludes = [ ];
    in
    builtins.listToAttrs (
      map
        (path: {
          name = "lua/${lib.path.removePrefix dir path}";
          value.source = path;
        })
        (
          builtins.filter (
            f:
            !(builtins.elem f excludes)
            && (lib.hasSuffix ".lua" (toString f))
            && !(lib.hasPrefix "_" (builtins.baseNameOf (toString f)))
          ) (lib.filesystem.listFilesRecursive dir)
        )
    );
}
