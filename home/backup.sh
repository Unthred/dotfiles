#!/bin/bash
BACKUP_DIR="/mnt/disks/downloadDisk/backup/root"
CASTLE="$HOME/.homesick/repos/dotfiles"
PUSH_COOLDOWN=300
LAST_PUSH=0

# Skip agent-tool paths persisted on the array (plugin appdata / symlinks).
RSYNC_EXCLUDES=(
  --exclude='.cursor'
  --exclude='.claude'
  --exclude='.claude.json'
  --exclude='.local/bin/claude'
  --exclude='.local/share/claude'
)

while inotifywait -r -e modify,create,delete,move /root 2>/dev/null; do
    rsync -avz "${RSYNC_EXCLUDES[@]}" /root/ "$BACKUP_DIR/"

    NOW=$(date +%s)
    if (( NOW - LAST_PUSH >= PUSH_COOLDOWN )); then
        cd "$CASTLE" || continue
        git add -A
        if ! git diff --cached --quiet; then
            git commit -m "auto: $(date '+%Y-%m-%d %H:%M')"
            if git push origin master 2>/dev/null; then
                LAST_PUSH=$NOW
            fi
        fi
    fi
done
