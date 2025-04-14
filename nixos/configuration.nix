{ config, pkgs, ... }:

let
    gaming = {
        extraGroups = [
            "audio"
        ];
        isNormalUser = true;
        shell = pkgs.fish;
    };
in
{
    imports = [
        ./programs/steam
    ];

    users.users = {
        inherit gaming;
    };
}