{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Coding stuff
    cargo
    clang
    clang-tools
    gcc
    gnumake
    mono
    python312
    python312Packages.pip
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
    radare2
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
