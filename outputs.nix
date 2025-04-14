{ flake-parts-lib, lib, withSystem, inputs, ... }:

let
    inherit (inputs) xmonad;
    inherit (inputs.home-manager.lib) homeManagerConfiguration;

    overlays = [
        inputs.nurpkgs.overlays.default
        (final: prev: {
            firefox-addons = final.nur.repos.rycee.firefox-addons;
        })
    ];

    system = "x86_64-linux";
in
{
    flake = {
        homeConfigurations = withSystem system ({pkgs, ...}: {
            default = homeManagerConfiguration {
                modules = [
                    ./home.nix
                    xmonad.homeModules.xmonad
                ];

                pkgs = import inputs.nixpkgs {
                    config.allowUnfree = true;
                    inherit overlays system;
                };
            };
        });

        homeModules = {
            gaming = ./home.nix;
        };

        nixosModules = {
            gaming = ./configuration.nix;
            vr = ./vr.nix;
        };
    };
}