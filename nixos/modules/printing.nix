{ pkgs, ... }: {
  services.printing = {
    enable = true;  # Enable the printing service
    drivers = [ pkgs.samsung-unified-linux-driver ];  # Specify the driver for Samsung printers
  };
}
