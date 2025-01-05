{
  qt6Packages,
  inputs,
  tweakedWaterShader ? true,
  ...
}:

qt6Packages.callPackage ./package.nix {
  inputs = inputs;
  tweakedWaterShader = tweakedWaterShader;
}
