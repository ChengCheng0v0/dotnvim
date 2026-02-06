{ lib, ... }:

let
  self =
    let
      excludes = [
        ./default.nix
      ];

      modules = builtins.filter (
        f:
        !(builtins.elem f excludes)
        && !(lib.hasPrefix "_" (baseNameOf f))
        && (lib.hasSuffix ".nix" (toString f))
      ) (lib.filesystem.listFilesRecursive ./.);

      callLib =
        file:
        import file {
          lib = lib.extend (_: _: self);
        };
    in
    builtins.foldl' lib.recursiveUpdate { } (
      map (
        m:
        let
          kind = builtins.head (lib.path.subpath.components (lib.path.removePrefix ./. m));
          funcs = callLib m;
        in
        if kind == "top-level" then funcs else { ${kind} = funcs; }
      ) modules
    );
in

self
