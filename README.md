# ❄️ **My NixOS Server Config**

Don't forget to change `SECURE_PASSWORD_HERE`, `BIG_SECRET_HERE` and `trusted_domains` in [./nixos/modules/nextcloud.nix](./nixos/modules/nextcloud.nix). Also check `disabledModules` in [./nixos/configuration.nix](./nixos/configuration.nix) and bootloader in [./nixos/bootloader.nix](./nixos/bootloader.nix).

```bash
git clone https://github.com/TheIIIrd/nixos-srv.git ~/.nix && cd ~/.nix
```

```bash
cp --no-preserve=mode /etc/nixos/hardware-configuration.nix ~/.nix/nixos/
sed -i "s/<username>/$USER/g" ~/.nix/flake.nix && sed -i "s/<username>/$USER/g" ~/.nix/nixos/modules/user.nix && sed -i "s/<username>/$USER/g" ~/.nix/home-manager/home.nix
```

```bash
git add .
sudo nixos-rebuild boot --upgrade --flake .
home-manager switch -b backup --flake .
```

## After installation
```bash
nextcloud-occ maintenance:repair --include-expensive
nextcloud-occ config:system:set maintenance_window_start --type=integer --value=1
nextcloud-occ config:app:set files max_chunk_size --value 20971520 # Sometimes it can help
nextcloud-occ db:add-missing-indices
```
