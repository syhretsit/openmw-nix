{
    description = "A flake containing useful things for playing OpenMW";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        snowfall-lib = {
            url = "github:snowfallorg/lib";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        mygui.url = "github:Tofixrs/nixpkgs/mygui";
    };

    outputs = inputs: inputs.snowfall-lib.mkFlake {
        inherit inputs;

        src = ./.;

        snowfall.namespace = "custom";
    };
}
