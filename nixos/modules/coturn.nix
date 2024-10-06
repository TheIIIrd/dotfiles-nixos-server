{
  services.coturn = {
    enable = true;
    listening-port = 3478;
    cert = "/var/lib/acme/nixos.nextcloud.local/fullchain.pem";
    pkey = "/var/lib/acme/nixos.nextcloud.local/key.pem";
  };
}
