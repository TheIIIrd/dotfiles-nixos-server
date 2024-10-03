{
  services.openssh = {
    enable = true;
    ports = [ 7454 ];
    settings = {
      PasswordAuthentication = true;  # Allow password auth
      AllowUsers = null;              # Allow all users
      UseDns = true;                  # Use DNS for lookups
      X11Forwarding = false;          # Disable X11 forwarding
      PermitRootLogin = "no";         # Disallow root login
    };
  };

  services.fail2ban.enable = true;
}
