#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) as FLAG in the challenge's
# config.py, keeping its other settings; without one (CI, a run by hand) the development flag.
dev='CTF{dev-google-ctf-2023-cursved}'
v="${CTF_FLAG_MAIN:-$dev}"
f=/chroot/home/user/config.py
rest="$(grep -v '^FLAG = ' "$f")"
printf '%s\nFLAG = "%s"\n' "$rest" "$v" > "$f"
chmod 444 "$f"
