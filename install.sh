#!/bin/bash
# Installs Pomodoro for the current user (no root needed).
set -euo pipefail
cd "$(dirname "$0")"
P="$HOME/.local"; ID=io.github.PomodoroGnome
mkdir -p "$P/bin" "$P/share/pomodoro-gnome" "$P/share/applications" \
  "$P/share/icons/hicolor/scalable/apps" "$P/share/dbus-1/services"
install -m 755 pomodoro-gnome "$P/bin/pomodoro-gnome"
cp -r data/chime.oga data/sounds "$P/share/pomodoro-gnome/"
install -m 644 data/icons/$ID.svg "$P/share/icons/hicolor/scalable/apps/"
sed "s|@BIN@|$P/bin/pomodoro-gnome|" data/$ID.desktop > "$P/share/applications/$ID.desktop"
sed "s|@BIN@|$P/bin/pomodoro-gnome|" data/$ID.service > "$P/share/dbus-1/services/$ID.service"
gtk-update-icon-cache -q "$P/share/icons/hicolor" 2>/dev/null || true
update-desktop-database "$P/share/applications" 2>/dev/null || true
echo "Installed. Find 'Pomodoro' in Activities."
