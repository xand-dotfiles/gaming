let
    nixosModules = {
        gaming = ./configuration.nix;
        vr = ./vr.nix;
    };
in
{
    flake = {
        inherit nixosModules;
    };
}