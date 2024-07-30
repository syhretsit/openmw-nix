# OpenMW-Nix

### How to use

```nix
{
  inputs = {
    openmw-nix = {
      url = "git+https://codeberg.org/PopeRigby/openmw-nix.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = flakes @ {
    self,
    nixpkgs,
    openmw-nix,
    ...
  }: {
    nixosConfiguration.<your-hostname> = nixpkgs.lib.nixosSystem {
      modules = [
        ({ inputs, ... }: {
          environment.systemPackages = with inputs.openmw-nix.<your-system>.packages; [
            delta-plugin
            openmw-nightly
            openmw-validator
            plox
          ]
        })
      ];
    };
  };
}
```
