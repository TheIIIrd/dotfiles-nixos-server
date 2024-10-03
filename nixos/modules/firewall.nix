{
  networking.firewall = {
    enable = true;                      # Enable the firewall
    allowedTCPPorts = [ 80 443 7454 ];  # Allow HTTP, HTTPS, and SSH on port 7454
  };
}
