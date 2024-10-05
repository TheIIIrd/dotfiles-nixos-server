{ pkgs, ... }: {
  # Environment setup for Nextcloud admin password
  environment.etc."nextcloud-admin-pass".text = "SECURE_PASSWORD_HERE";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "nixos.nextcloud.local";

    database.createLocally = true;

    caching.apcu = true;

    autoUpdateApps.enable = true;
    maxUploadSize = "1G";
    https = true;

    settings = {
      trusted_domains = [ "nixos.nextcloud.local" ]; # Domain from which you can access the server
      log_type = "file";
      # overwriteprotocol = "https";  # Force Nextcloud to always use HTTPS
      # default_phone_region = "PL"   # An ISO 3166-1 country code
    };

    config = {
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };

  services.nginx.virtualHosts = {
    "nixos.nextcloud.local" = {
      forceSSL = true;
      enableACME = true;
    };
  };

  security.acme = {
    acceptTerms = true;   
    certs = { 
      "nixos.nextcloud.local".email = "nextcloud@nextcloud.local";
    };
  };
}
