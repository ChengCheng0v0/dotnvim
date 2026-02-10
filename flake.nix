{
  description = "Cheng's Neovim (Nixvim) configuration!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts/main";

    nixvim.url = "github:nix-community/nixvim/main";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay/master";
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit self inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        ./flake-modules/shell.nix
      ];

      flake = {
        nixvimModules.default =
          { pkgs, ... }:
          {
            imports = [ ./config ];
            _module.args.lib' = import ./lib { inherit (pkgs) lib; };
          };
      };

      perSystem =
        {
          config,
          system,
          ...
        }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.neovim-nightly-overlay.overlays.default
            ];
          };

          nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = self.nixvimModules.default;
          };
        in
        rec {
          packages = {
            default = nvim;
          };

          apps = {
            default = apps.nvim;

            nvim = {
              type = "app";
              program = "${nvim}/bin/nvim";
            };

            nixvim-print-init = {
              type = "app";
              program = "${nvim}/bin/nixvim-print-init";
            };
          };
        };
    };
}
