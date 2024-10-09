{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Coding stuff
    python312
    python312Packages.pip
    clang
    clang-tools
    gcc
    cargo
    rustc
    zulu

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
    onefetch
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
