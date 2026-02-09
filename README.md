# 🏠 Home Manager Configuration

Personal Home Manager setup for macOS and Linux, structured into small, meaningful modules.

## ✨ Highlights
- 🔧 Modular layout (`modules/home/*`) without excessive fragmentation
- 🧩 Works on **macOS (Darwin)** and **Linux**
- 🗂️ Local machine settings kept **out of Git** via `local.nix`
- 🚀 Simple apply via `hm switch`

## ✅ Requirements
- 🧰 Nix with flakes enabled
- 🏡 Home Manager

> If you already use `home-manager`, you’re good to go.

## 🚀 Quick Start
1. Create your local settings file:
```bash
cp local.nix.example local.nix
```

2. Edit `local.nix` to match your user/home:
```nix
{
  username = "your-username";
  homeDirectory = "/Users/your-username"; # or /home/your-username on Linux
}
```

3. Apply the configuration:
```bash
hm switch
```

## 🧠 Why `hm switch` Works (and Plain `home-manager switch` Might Not)
This config keeps `local.nix` **gitignored and untracked**.  
Normal flake evaluation via `git+file://` can’t see untracked files, causing:
```
Path 'local.nix' ... is not tracked by Git
```

To avoid that, the `hm` alias is set to use a **path-based flake**:
```
home-manager --flake 'path:/Users/iskanred/.config/home-manager#iskanred'
```
Path-based flakes read directly from disk, so `local.nix` is visible locally but never committed.

## 🧩 Compatibility
- ✅ **macOS (Darwin)** supported
- ✅ **Linux** supported

Platform-specific packages are handled in:
- `modules/home/packages.nix`

## 🗂️ Layout
- `home.nix` — entry point that imports modules
- `modules/home/base.nix` — base settings, XDG, session vars
- `modules/home/packages.nix` — packages + per-platform lists
- `modules/home/files.nix` — managed dotfiles and scripts
- `modules/home/programs.nix` — Zsh, Neovim, fzf, aliases

## 🛠️ Useful Commands
```bash
hm switch         # apply config
hm switch -b bak  # backup conflicting files and apply
```

## ⚠️ Notes
- `local.nix` is intentionally in `.gitignore` and should **never** be committed.
- If you clone this repo on another machine, create `local.nix` again from the example.

## 🙌 Troubleshooting
- If `hm switch` fails, run:
```bash
home-manager --flake 'path:/full/path/to/repo#your-username' switch
```
- Check for typos in `local.nix`
