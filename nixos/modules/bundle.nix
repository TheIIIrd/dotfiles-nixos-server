{
  imports = [
    ./bootloader.nix  # Bootloader configuration
    ./firewall.nix    # Firewall configuration
    ./trim.nix        # Trim configuration
    ./zram.nix        # ZRAM configuration
    ./nm.nix          # NetworkManager configuration
    ./printing.nix    # Printing configuration
    ./user.nix        # User accounts and permissions
    ./env.nix         # Environment settings
    ./qemuguest.nix   # QEMU guest configuration
    ./zerotierone.nix # ZeroTier One settings
    ./tailscale.nix   # Tailscale settings
    ./yggdrasil.nix   # Yggdrasil settings
    ./ssh.nix         # SSH configuration
    ./nextcloud.nix   # Nextcloud configuration
  ];
}
