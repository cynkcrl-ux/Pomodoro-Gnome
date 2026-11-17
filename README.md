# Pomodoro for GNOME

A GTK4 / libadwaita port of [omarchy-pomodoro](https://github.com/alessandrobelli/omarchy-pomodoro)
(MIT) as a standalone app instead of a shell bar widget.

Features: focus/break timer with presets (25/30/50/custom), start/pause/skip/reset,
YouTube live streams or ambient sounds (rain, rain on roof, white/brown noise) as focus
music via mpv, chime + desktop notifications, auto-start next focus, stop music during
breaks, and the timer survives restarts. Closing the window while a session runs keeps it
going in the background; open the app again (or click the notification) to bring it back.

Not ported: TickTick logging.

## Requirements
`python3`, `python3-gi`, `gir1.2-adw-1` (libadwaita 1.5+),
`mpv`, `yt-dlp` (for YouTube), and `pw-play` or `paplay` for the chime.

    # Debian/Ubuntu
    sudo apt install python3-gi gir1.2-adw-1 mpv yt-dlp
    # Fedora
    sudo dnf install python3-gobject libadwaita mpv yt-dlp

## Install / remove
    ./install.sh
    ./uninstall.sh

## Scripting (e.g. keyboard shortcuts)
    gapplication action io.github.PomodoroGnome start-pause   # also: skip, reset, restart-music, present
Shortcuts in the app: Ctrl+Space start/pause, Ctrl+, preferences, Ctrl+Q quit.

## Troubleshooting music
mpv's log is written to `~/.local/state/pomodoro-gnome/mpv.log`. The app reconnects dropped
streams automatically and un-pauses mpv if something else pauses it. If music keeps failing,
update yt-dlp (YouTube changes often) and check that log.
Ctrl+W closes the window (the timer keeps running if a session is active).
