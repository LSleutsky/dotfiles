#!/usr/bin/env bash
# Set up this machine from the dotfiles repo.
# Every step is idempotent and safe to re-run.
#
#   ./bootstrap.sh           run every step
#   ./bootstrap.sh links     symlink configs into place
#   ./bootstrap.sh packages  install pacman + AUR packages
#   ./bootstrap.sh system    copy system/ into / (needs sudo)
#   ./bootstrap.sh units     enable systemd units
#   ./bootstrap.sh dconf     restore GTK/desktop settings
#   ./bootstrap.sh gtk       wire Matugen colors into GTK

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# repo path -> target path
LINKS=(
  ".zshrc:$HOME/.zshrc"
  ".vimrc:$HOME/.vimrc"
  ".nanorc:$HOME/.nanorc"
  ".gitconfig:$HOME/.gitconfig"
  "atuin:$HOME/.config/atuin"
  "fastfetch:$HOME/.config/fastfetch"
  "ghostty:$HOME/.config/ghostty"
  "niri:$HOME/.config/niri"
  "DankMaterialShell:$HOME/.config/DankMaterialShell"
  "starship.toml:$HOME/.config/starship.toml"
  "icons:$HOME/.icons"
)

SYSTEM_UNITS=(greetd NetworkManager sshd thermald power-profiles-daemon)
USER_UNITS=(dms.service)

info() { printf '\033[1;34m::\033[0m %s\n' "$1"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$1"; }

do_links() {
  info "Linking configs"
  for pair in "${LINKS[@]}"; do
    src="$REPO/${pair%%:*}"
    dst="${pair#*:}"

    [ -e "$src" ] || { warn "missing in repo, skipped: ${pair%%:*}"; continue; }

    # already correct
    if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
      continue
    fi

    # move anything real out of the way rather than clobbering it
    if [ -e "$dst" ] || [ -L "$dst" ]; then
      mkdir -p "$BACKUP"
      mv "$dst" "$BACKUP/"
      warn "backed up existing $dst -> $BACKUP/"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "   $dst -> $src"
  done
}

do_packages() {
  info "Installing packages from repos"
  sudo pacman -S --needed --noconfirm - < "$REPO/packages/pacman.txt"

  info "Installing AUR packages"
  if command -v paru >/dev/null; then
    paru -S --needed --noconfirm - < "$REPO/packages/aur.txt"
  else
    warn "paru not installed; bootstrap it first, then re-run: ./bootstrap.sh packages"
  fi
}

do_system() {
  info "Installing system/ into /"
  # preserve each file's mode (hibernate-delay.sh and dotfiles-pkglist must stay 755)
  while IFS= read -r f; do
    rel="${f#"$REPO"/system}"
    sudo install -Dm"$(stat -c %a "$f")" "$f" "$rel"
    echo "   $rel"
  done < <(find "$REPO/system" -type f)
}

do_units() {
  info "Enabling system units"
  for u in "${SYSTEM_UNITS[@]}"; do
    sudo systemctl enable "$u" 2>/dev/null && echo "   $u" || warn "could not enable $u"
  done

  info "Enabling user units"
  for u in "${USER_UNITS[@]}"; do
    systemctl --user enable "$u" 2>/dev/null && echo "   $u" || warn "could not enable $u"
  done
}

do_dconf() {
  info "Restoring dconf settings"
  dconf load /org/gnome/desktop/interface/ < "$REPO/dconf-interface.ini"
  echo "   /org/gnome/desktop/interface/"
}

do_gtk() {
  # DMS/Matugen writes dank-colors.css into these dirs, but GTK only ever
  # auto-loads gtk.css - without this import the generated colors are inert.
  info "Wiring Matugen colors into GTK"
  for d in "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"; do
    mkdir -p "$d"
    printf '@import url("dank-colors.css");\n' > "$d/gtk.css"
    echo "   $d/gtk.css"
  done
}

case "${1:-all}" in
  links)    do_links ;;
  packages) do_packages ;;
  system)   do_system ;;
  units)    do_units ;;
  dconf)    do_dconf ;;
  gtk)      do_gtk ;;
  all)      do_links; do_packages; do_system; do_units; do_dconf; do_gtk ;;
  *)        sed -n '2,12p' "$0" | sed 's/^# \?//'; exit 1 ;;
esac

info "Done."
