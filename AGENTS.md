# AGENTS

Concise guidelines for automated changes in this repository.

## Structure
- `home.nix` only contains `imports`.
- Modules live in `modules/home/` and are grouped by concern.
- Dotfiles live in `files/` and are linked via Home Manager.

## Local-only config
- `local.nix` must remain gitignored.
- Use `local.nix.example` as a template.
- Flake commands should use `path:` so untracked `local.nix` is visible:
  - `home-manager --flake "path:$HOME/.config/home-manager#$USER" switch`
  - Prefer the `hm` alias.

## Editing rules
- Keep changes minimal and focused.
- Avoid new modules unless a new concern appears.
- Update `modules/home/files.nix` when adding files under `files/`.

## Validation
- Run `home-manager --flake "path:$HOME/.config/home-manager#$USER" switch`.
- If shell configs change, ensure `hm switch` works and startup is clean.

## Commit hygiene
- Never stage or commit `local.nix`.
- Use short, descriptive commit messages (imperative mood).
- Always include a short description of a commit with listing what has been changed in each scope.
