# ❄️ My NixOS Server Config ![Nix](https://img.shields.io/badge/This_is-Nix-blue?logo=NixOS)

Don't forget to change `SECURE_PASSWORD_HERE` and `<domain>` in [./nixos/modules/nextcloud.nix](./nixos/modules/nextcloud.nix)

```bash
git clone https://github.com/TheIIIrd/nixos-custom-server.git ~/.nix && cd ~/.nix
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

After installation
```bash
nextcloud-occ maintenance:repair --include-expensive
```
