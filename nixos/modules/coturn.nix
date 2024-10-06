{
  services.coturn = {
    enable = true;
    listening-port = 3478;
    use-auth-secret = true;
    static-auth-secret = "SECURE_SECRET_HERE";
    cert = "/var/lib/acme/nixos.nextcloud.local/fullchain.pem";
    pkey = "/var/lib/acme/nixos.nextcloud.local/key.pem";
  };
}
