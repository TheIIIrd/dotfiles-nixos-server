{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # CLI utils
    aria2
    bat
    bind
    curl
    fastfetch
    ffmpeg
    file
    git
    htop
    inxi
    ipset
    lshw
    neovim
    openssl
    tree
    tldr
    unzip
    wget
    zip

    # Other
    home-manager
    nix-index
    zram-generator
  ];
}
