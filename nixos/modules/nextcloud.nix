{ pkgs, config, ... }: {
  # Environment setup for Nextcloud admin password
  environment.etc."nextcloud-admin-pass".text = "SECURE_PASSWORD_HERE";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "localhost";

    database.createLocally = true;

    configureRedis = true;
    caching.redis = true;

    autoUpdateApps.enable = true;
    maxUploadSize = "1G";
    https = true;

    settings = {
      trusted_domains = [ "<domain>" ]; # Domain from which you can access the server
      log_type = "file";
      overwriteprotocol = "https";
    };

    config = {
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };

  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  security.acme = {
    acceptTerms = true;   
    certs = { 
      ${config.services.nextcloud.hostName}.email = "<your-letsencrypt-email@example.com>";
    };
  };
}
