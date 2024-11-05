{ pkgs, ... }: {
  # Environment setup for Nextcloud admin password
  environment.etc."nextcloud-admin-pass".text = "SECURE_PASSWORD_HERE";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "nixos.nextcloud.local";

    database.createLocally = true;

    caching.apcu = true;
    phpOptions."opcache.interned_strings_buffer" = "32";

    autoUpdateApps.enable = true;
    maxUploadSize = "8G";
    https = true;

    settings = {
      trusted_domains = [ "nixos.nextcloud.local" ]; # Domain from which you can access the server
      log_type = "file";
      default_phone_region = "PL";    # An ISO 3166-1 country code
      # overwriteprotocol = "https";  # Force Nextcloud to always use HTTPS
    };

    config = {
      adminuser = "r00t";
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };

  services.coturn = {
    enable = true;
    listening-port = 3478;  # Port for incoming connections
    use-auth-secret = true;
    static-auth-secret = "BIG_SECRET_HERE"; # Secret for TURN authentication
    cert = "/var/lib/acme/nixos.nextcloud.local/fullchain.pem"; # Path to SSL certificate
    pkey = "/var/lib/acme/nixos.nextcloud.local/key.pem";       # Path to private key
  };

  services.nginx.virtualHosts = {
    "nixos.nextcloud.local" = {
      forceSSL = true;    # Force SSL for security
      enableACME = true;  # Enable automatic SSL certificate management
    };
  };

  security.acme = {
    acceptTerms = true;
    certs = { 
      "nixos.nextcloud.local".email = "nextcloud@nextcloud.local";
    };
  };
}
