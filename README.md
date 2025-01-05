# OpenMW-Nix

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

### Using the water shader

To use Wareya's screen space reflection based [water shader](https://cdn.discordapp.com/attachments/718892786157617163/1323005352710766767/water.omwfx?ex=677c2ac0&is=677ad940&hm=0eaed779f1f4c4f54112362a17b867da4d9a384c51be010322641cfba41c5be2&), pass `tweakedWaterShader = true` to `openmw-nix`.
