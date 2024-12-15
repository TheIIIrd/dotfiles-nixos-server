{ config, ... }: {
  programs.zsh = {
    enable                    = true;
    enableCompletion          = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;

    shellAliases = let
      flakeDir = "~/.nix";
    in {
      rb       = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd      = "nix flake update --flake ${flakeDir}";
      upg      = "sudo nixos-rebuild boot --upgrade --flake ${flakeDir}";
      hms      = "home-manager switch -b backup --flake ${flakeDir}";

      conf     = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs     = "nvim ${flakeDir}/nixos/packages.nix";
      ll       = "ls -l";
      v        = "nvim";
      ff       = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable  = true;
      plugins = [ "git" "sudo" ];
      theme   = "fishy";
    };
  };
}
