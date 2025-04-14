{ config, pkgs, ... }:

{
    imports = [
        ./services/monado
    ];
}