# AGENTS

Best-practice guidelines for automated changes in this repository.

## Scope
- This repo contains Home Manager configuration for macOS and Linux.
- Configuration is modular; avoid reintroducing monolithic `home.nix`.

## Structure
- `home.nix` is the entry point and should only contain `imports`.
- Modules live in `modules/home/` and are grouped by concern:
  - `base.nix` — user/home, XDG, session vars, paths
  - `packages.nix` — packages and platform-specific lists
  - `files.nix` — `xdg.configFile` and `home.file` links
  - `programs.nix` — program configs and aliases
- Dotfiles live in `files/` and are linked via Home Manager.

## Local-only config
- `local.nix` is local-only and **must remain gitignored**.
- `local.nix.example` is the template for new machines.
- Any flake command must use a `path:` reference so untracked `local.nix` is visible:
  - `home-manager --flake 'path:/Users/iskanred/.config/home-manager#iskanred' switch`
  - Prefer the `hm` alias in Zsh.

## Editing rules
- Prefer minimal, focused changes; avoid reformatting unrelated sections.
- Keep comments rare and only for non-obvious behavior.
- Avoid adding new modules unless they represent a clear new concern.
- When introducing new files under `files/`, update `modules/home/files.nix`.

## OS compatibility
- Keep macOS/Linux differences in `modules/home/packages.nix` via `lib.optionals`.
- Avoid OS-specific logic inside dotfiles unless unavoidable.

## Validation
- After changes, run:
  - `home-manager --flake path:.#iskanred switch`
- If the change touches Zsh prompt or configs, ensure `hm switch` works and shell startup is clean.

## Commit hygiene
- Do not stage or commit `local.nix`.
- Keep commit messages short and descriptive (imperative mood).
