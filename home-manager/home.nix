{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username      = "<username>";
    homeDirectory = "/home/<username>";
    stateVersion  = "24.11";
  };
}
