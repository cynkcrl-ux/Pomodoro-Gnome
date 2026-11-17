#!/bin/bash
P="$HOME/.local"; ID=io.github.PomodoroGnome
rm -rf "$P/bin/pomodoro-gnome" "$P/share/pomodoro-gnome" "$P/share/applications/$ID.desktop" \
  "$P/share/dbus-1/services/$ID.service" "$P/share/icons/hicolor/scalable/apps/$ID.svg"
echo "Removed. Settings remain in ~/.config/pomodoro-gnome and ~/.local/state/pomodoro-gnome."
