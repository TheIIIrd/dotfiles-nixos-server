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

    settings.trusted_domains = [ "127.0.0.1/8" "192.168.0.0/16" "fd00::/8" ];

    config = {
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
