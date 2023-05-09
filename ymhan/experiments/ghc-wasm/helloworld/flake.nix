{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    ghc-wasm-meta.url = "gitlab:ghc/ghc-wasm-meta?host=gitlab.haskell.org";
  };
  outputs = { self, nixpkgs, flake-utils, ghc-wasm-meta }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = (import nixpkgs { inherit system; }).pkgs;
        in
        {
          packages = flake-utils.lib.flattenTree {
            update = pkgs.writeShellApplication {
              name = "update";
              runtimeInputs = [
                ghc-wasm-meta.packages.${system}.default
              ];
              text = ''
                wasm32-wasi-cabal update
              '';
            };
            build = pkgs.writeShellApplication {
              name = "build";
              runtimeInputs = [
                pkgs.nodejs
                ghc-wasm-meta.packages.${system}.default
                pkgs.busybox
              ];
              text = ''
                npm install
                npm run build
                wasm32-wasi-cabal build -v
                experiment=$(wasm32-wasi-cabal list-bin exe:experiment)
                cp "$experiment" dist
              '';
            };
          };
        }
      );
}

# --with-gcc ${pkgs.gcc}/bin/gcc
