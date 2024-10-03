{
  # Enable the GRUB bootloader
  boot.loader.grub.enable = true;
  
  # Specify the target device for the GRUB installation
  boot.loader.grub.device = "/dev/vda";
  
  # Use OS prober to detect other operating systems
  boot.loader.grub.useOSProber = true;
}
