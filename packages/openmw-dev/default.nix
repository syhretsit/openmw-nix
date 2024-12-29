{ qt6Packages, inputs, ... }:

qt6Packages.callPackage ./package.nix { inputs = inputs; }
