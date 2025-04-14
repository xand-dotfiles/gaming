{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        opencomposite
    ];

    imports = [
        ./services/opencomposite
    ];
}