# [OpenMW-Nix Fork](https://codeberg.org/PopeRigby/openmw-nix)

## Usage

```nix
{
  inputs = {
    openmw-nix = {
      url = "git+https://codeberg.org/PopeRigby/openmw-nix.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    openmw-nix,
    ...
  }: {
    nixosConfiguration.<your-hostname> = nixpkgs.lib.nixosSystem {
      environment.systemPackages = with openmw-nix.packages.<your-system>; [
        delta-plugin
        openmw-dev
        openmw-validator
        plox
      ];
    };
  };
}
```
