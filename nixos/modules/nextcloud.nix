{ pkgs, ... }: {
  # Environment setup for Nextcloud admin password
  environment.etc."nextcloud-admin-pass".text = "SECURE_PASSWORD_HERE";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "localhost";

    database.createLocally = true;
    configureRedis = true;

    autoUpdateApps.enable = true;
    maxUploadSize = "1G";

    # Domain from which you can access the server
    settings.trusted_domains = [ "<domain>" ];

    config = {
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
