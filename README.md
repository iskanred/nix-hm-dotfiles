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

## 🎨 Themes

Theme settings are intentionally **separate** per tool. There is no unified theme script.

### 🧩 Variables (source of truth)
Defined in `modules/home/base.nix` under `home.sessionVariables`:
- `KITTY_THEME` — selects Kitty theme file name (without `.conf`)
- `NVIM_THEME` — selects Neovim theme module name
- `BAT_THEME` — selects bat theme name

Example:
```nix
home.sessionVariables = {
  KITTY_THEME = "one-dark";
  NVIM_THEME = "one-dark";
  BAT_THEME = "OneHalfDark";
};
```

### 🐱 Kitty
- Config: `files/kitty/kitty.conf`
- Theme include is **generated** by Home Manager:
  - `~/.config/kitty/theme.conf` contains:
    ```
    include themes/<KITTY_THEME>.conf
    ```
- Theme files live in:
  - `files/kitty/themes/<name>.conf`

### ✍️ Neovim
- Loader: `files/nvim/lua/config/theme.lua`
- Theme modules live in:
  - `files/nvim/lua/themes/<name>.lua`
- Selected via `NVIM_THEME`

### 🦇 bat
- Controlled only by `BAT_THEME`
- List available themes:
  ```bash
  bat --list-themes
  ```

### 🔁 Changing themes
1. Update variables in `modules/home/base.nix`.
2. Run:
```bash
hm switch
```

### ➕ Adding a new theme
1. **Kitty:** add `files/kitty/themes/<name>.conf`
2. **Neovim:** add `files/nvim/lua/themes/<name>.lua`
3. **bat:** ensure the theme exists in `bat --list-themes`
4. Set `KITTY_THEME` / `NVIM_THEME` / `BAT_THEME` to those names.

## 🛠️ Useful Commands
```bash
hm switch         # apply config
hm switch -b bak  # backup conflicting files and apply
```

## ⚠️ Notes
- `local.nix` is intentionally in `.gitignore` and should **never** be committed.
- If you clone this repo on another machine, create `local.nix` again from the example.
- 📝 This README uses meaningful emojis to improve scanability.

## 🙌 Troubleshooting
- If `hm switch` fails, run:
```bash
home-manager --flake 'path:/full/path/to/repo#your-username' switch
```
- Check for typos in `local.nix`
