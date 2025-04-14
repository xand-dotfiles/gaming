{
    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        hm-flake-parts.url = "git+ssh://git@git.computeroid.org/xand-dotfiles/hm-flake-parts-backport";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.url = "nixpkgs/nixos-24.11";

        xmonad = {
            url = "git+ssh://git@git.computeroid.org/xand-dotfiles/xmonad";
            inputs.home-manager.follows = "home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nurpkgs = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        rycee-firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {flake-parts, ...} @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                inputs.hm-flake-parts.flakeModule
                ./outputs.nix
            ];

            systems = [
                "x86_64-linux"
            ];
        };
}