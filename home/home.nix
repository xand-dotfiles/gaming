{ config, pkgs, ... }:

let
    username = "gaming";
    homeDirectory = "/home/${username}";

    heroic-fix = pkgs.heroic.override {
        extraPkgs = pkgs: [
            pkgs.zip
        ];
    };
in
{
    home = {
        inherit homeDirectory username;
        packages = with pkgs; [
            coppwr
            discord
            heroic-fix
            pwvucontrol
            recordbox
        ];
        stateVersion = "24.11";
    };

    imports = [
        ./programs/firefox
        ./programs/fish
        ./programs/git
        ./programs/vscodium
        ./services/easyeffects
    ];

    news.display = "silent";

    programs.home-manager.enable = true;

    gtk = {
        enable = true;
        iconTheme = {
            name = "Kanagawa";
            package = pkgs.kanagawa-icon-theme;
        };
        theme = {
            name = "Kanagawa-B";
            package = pkgs.kanagawa-gtk-theme;
        };
    };
}