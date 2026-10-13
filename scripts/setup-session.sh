#!/usr/bin/env bash
# Installs the tools behind the skills in this repo (graft + chatmonteur).
# Idempotent; run by the SessionStart hook in the background on cloud sessions.
set -uo pipefail
have() { command -v "$1" >/dev/null 2>&1; }

echo "[skills] $(date -Is) setup start"

# graft — code context graph (https://github.com/trailhq/graft)
have graft || npm install -g @nanonets/graft

# chatmonteur — video editing CLI (https://github.com/ArtCog/chatmonteur)
CM="$HOME/chatmonteur"
[ -d "$CM/.git" ] || git clone --depth 1 https://github.com/ArtCog/chatmonteur "$CM"
if ! have chatmonteur || [ ! -f "$CM/config.toml" ]; then
  (cd "$CM" && ./setup.sh)
fi
# No GPU in cloud containers: NVENC is listed by ffmpeg but cannot open.
if [ -f "$CM/config.toml" ] && ! have nvidia-smi; then
  sed -i 's/^encoder = "auto" /encoder = "libx264"/' "$CM/config.toml"
fi

echo "[skills] $(date -Is) setup done"
