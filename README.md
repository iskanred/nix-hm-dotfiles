# 🏠 Home Manager Configuration

Minimal Home Manager setup for macOS and Linux.

## ✨ Highlights
- 🔧 Modular layout (`modules/home/*`)
- 🧩 Works on macOS (Darwin) and Linux
- 🗂️ Local machine settings kept out of Git via `local.nix`

## 🧰 Install Nix + Home Manager
Follow the official guides:
- Nix: [nixos.org/download.html](https://nixos.org/download.html)
- Home Manager: [nix-community.github.io/home-manager](https://nix-community.github.io/home-manager/)

Enable [flakes](https://nixos.wiki/wiki/Flakes) in `/etc/nix/nix.conf`:
```ini
experimental-features = nix-command flakes
```

## 🚀 Quick Start
1. Create your local settings:
```bash
cp local.nix.example local.nix
```

2. Edit `local.nix`:
```nix
{
  username = "your-username"; # usually: `echo $USER`
  homeDirectory = "/Users/your-username"; # or /home/your-username on Linux; usually: `echo $HOME`
  system = "aarch64-darwin"; # or x86_64-linux, aarch64-linux, x86_64-darwin
}
```

3. Verify flakes work:
```bash
nix flake show
```

4. Apply:
```bash
home-manager --flake "path:$HOME/.config/home-manager#$USER" switch
```

## 🧩 System Values
Set `system` in `local.nix`:
- `x86_64-linux` (most PCs/laptops)
- `aarch64-linux` (ARM Linux)
- `x86_64-darwin` (Intel macOS)
- `aarch64-darwin` (Apple Silicon macOS)

Full list:
[Nixpkgs platforms](https://nixos.org/manual/nixpkgs/stable/#chap-platforms)

## 🗂️ Layout
- `home.nix` — entry point
- `modules/home/base.nix` — base settings, XDG, session vars
- `modules/home/packages.nix` — packages + per-platform lists
- `modules/home/files.nix` — managed dotfiles
- `modules/home/programs.nix` — program configs & aliases

## 🧹 Storage Cleanup
- `hm generations` — list saved Home Manager generations.
- `hm expire-generations "-30 days"` — remove old generations (keeps recent).
- `nix-collect-garbage -d` — delete unused store paths.
- `nix-store --optimise` — hardlink store paths to save space.

## 🎨 Themes (quick reference)
The following environment variables are responsible for themes:
- `KITTY_THEME` controls Kitty theme; config is in `files/kitty/kitty.conf`; theme files live in `files/kitty/themes/<name>.conf`.
- `NVIM_THEME` controls Neovim themes; loader is in `files/nvim/lua/config/theme.lua`; theme modules live in `files/nvim/lua/themes/<name>.lua`.
- `BAT_THEME` controls bat themes; list available themes with `bat --list-themes`.

Change theme by updating these variables in `modules/home/base.nix`, then run:
```bash
hm switch
```

## ⚠️ Notes
- `local.nix` is intentionally gitignored and must not be committed.
- If you clone this repo elsewhere, recreate `local.nix` from the example.
- After the first successful switch, `hm` is available as a shortcut for:
  `home-manager --flake "path:$HOME/.config/home-manager#$USER"`.
- The `hm` alias also avoids the `flake/local.nix` visibility issue related to `git` by always using `path:`.
- If `hm` isn't available yet, run the full command once:
  ```bash
  home-manager --flake "path:$HOME/.config/home-manager#$USER" switch
  ```
