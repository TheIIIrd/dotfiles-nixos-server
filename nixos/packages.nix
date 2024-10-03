{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Coding stuff
    python312
    python312Packages.pip
    gnumake
    clang-tools
    clang
    gcc
    mono
    rustc
    cargo
    zulu

    # CLI utils
    fastfetch
    neovim
    openssl
    git
    wget
    curl
    aria2
    ipset
    bind
    file
    tree
    tldr
    bat
    zip
    unzip
    ffmpeg
    htop
    inxi
    lshw

    # Other
    nix-index
    home-manager
    zram-generator
  ];
}
