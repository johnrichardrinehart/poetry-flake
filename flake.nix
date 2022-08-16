{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    poetry2nix = nixpkgs.legacyPackages.${system}.poetry2nix;
  in
  {
    packages.x86_64-linux.poetry = poetry2nix.mkPoetryApplication {
      projectDir = ./.;
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.poetry;
  };
}
