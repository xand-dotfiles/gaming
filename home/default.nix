{ flake-parts-lib, lib, withSystem, inputs, ... }:

let
    inherit (inputs) xmonad;
    inherit (inputs.home-manager.lib) homeManagerConfiguration;

    homeModules = {
        gaming = ./home.nix;
        vr = ./vr.nix;
    };

    overlays = [
        inputs.nurpkgs.overlays.default
        (final: prev: {
            firefox-addons = final.nur.repos.rycee.firefox-addons;
        })
    ];

    system = "x86_64-linux";

    gaming = homeManagerConfiguration {
        modules = [
            ./home.nix
            xmonad.homeModules.xmonad
        ];

        pkgs = import inputs.nixpkgs {
            config.allowUnfree = true;
            inherit overlays system;
        };
    };

    vr = homeManagerConfiguration {
        modules = [
            ./home.nix
            ./vr.nix
            xmonad.homeModules.xmonad
        ];

        pkgs = import inputs.nixpkgs {
            config.allowUnfree = true;
            inherit overlays system;
        };
    };

    homeConfigurations =  {
        inherit gaming vr;
        default = gaming;
    };
in
{
    flake = {
        inherit homeConfigurations homeModules;
    };
}