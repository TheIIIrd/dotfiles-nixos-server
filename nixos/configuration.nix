{ inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [
    # ./modules/logind.nix
    ./modules/printing.nix
    ./modules/qemuguest.nix
    ./modules/zerotierone.nix
    ./modules/tailscale.nix
    ./modules/yggdrasil.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Warshaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT    = "pl_PL.UTF-8";
    LC_MONETARY       = "pl_PL.UTF-8";
    LC_NAME           = "pl_PL.UTF-8";
    LC_NUMERIC        = "pl_PL.UTF-8";
    LC_PAPER          = "pl_PL.UTF-8";
    LC_TELEPHONE      = "pl_PL.UTF-8";
    LC_TIME           = "pl_PL.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "24.11"; # Don't change it bro
}
