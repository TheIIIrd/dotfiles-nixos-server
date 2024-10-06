{
  networking.firewall = {
    enable = true;                          # Enable the firewall
    allowedTCPPorts = [ 80 443 7454 3478 ]; # Allow HTTP, HTTPS, CoTURN, and SSH on port 7454
    allowedUDPPorts = [ 7454 ];             # Allow CoTURN
  };
}
