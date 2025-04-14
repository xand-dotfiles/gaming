{
    flake = {
        nixosModules = {
            gaming = ./configuration.nix;
            vr = ./vr.nix;
        };
    };
}