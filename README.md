# dotfiles

niri + DankMaterialShell (DMS) on Arch.

## Layout

| Path | Goes to |
|---|---|
| `niri/`, `ghostty/`, `atuin/`, `fastfetch/`, `DankMaterialShell/` | `~/.config/<name>` (directory symlink) |
| `starship.toml` | `~/.config/starship.toml` |
| `.zshrc`, `.vimrc`, `.nanorc`, `.gitconfig` | `~/` |
| `system/` | mirrors absolute paths under `/` |
| `packages/` | `pacman.txt`, `aur.txt` — refreshed automatically by a pacman hook |
| `wallpapers/` | referenced by `spawn-at-startup` in `niri/config.kdl` |

## New machine

    git clone https://github.com/LSleutsky/dotfiles.git ~/.local/share/dotfiles
    cd ~/.local/share/dotfiles && ./bootstrap.sh

Or one step at a time: `links`, `packages`, `system`, `units`, `dconf`, `gtk`.

## Gotchas

**Symlink directories, not individual files.** DMS rewrites `niri/dms/*.kdl` and
`DankMaterialShell/settings.json` at runtime. Through a directory symlink those
writes land in this repo; with per-file symlinks an atomic write (temp + rename)
would silently replace the link with a regular file.

**Don't delete `niri/dms/*.kdl`.** `niri/config.kdl` has `include "dms/*.kdl"`
lines and niri *hard-fails* to load if any included file is missing — even the
auto-generated ones that churn on theme changes.

**Ghostty doesn't watch its config.** `gtk-single-instance = true` means one
process serves every window, so edits do nothing until you hit `ctrl+shift+,`
(`reload_config`). The reload notification is disabled, so there's no toast.

## Does NOT transfer — set up by hand

**Hibernate.** `system/usr/lib/systemd/system-sleep/hibernate-delay.sh` (suspend,
then hibernate 20 min later via an RTC alarm) installs fine but does nothing
until the new machine has:

- a swapfile or partition at least as large as RAM
- `resume=UUID=<swap-device-uuid>` on the kernel cmdline
- `resume_offset=` too, if the swap is a file rather than a partition

The hook *must* live in `/usr/lib/systemd/system-sleep/`. systemd only ever
scans that one directory — `/etc/systemd/system-sleep/` is never read, so a
hook placed there fails silently and the machine simply never hibernates.
pacman does not delete files it doesn't own, so a custom script there survives
systemd upgrades.

**Fingerprint reader.** `system/etc/udev/rules.d/90-fingerprint-no-autosuspend.rules`
matches Goodix `27c6:609c` specifically. That reader autosuspends after 2s and
then fails to answer verification, so unlocking silently falls back to a password
prompt. Different hardware needs new IDs from `lsusb` — the rule won't match and
will fail silently.

**Nothing secret is tracked here.** Keep it that way: no `~/.config/gh/hosts.yml`
(live OAuth token), no `~/.ssh` private keys, no `~/.local/share/atuin/key`.
