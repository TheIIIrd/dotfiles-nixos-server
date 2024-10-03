{
  zramSwap = {
    enable        = true;   # Enable ZRAM swap
    algorithm     = "lz4";  # Compression algorithm
    memoryPercent = 100;    # Percentage of memory to use for ZRAM
    priority      = 999;    # Priority of the ZRAM swap
  };
}
