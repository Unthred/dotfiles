while inotifywait -r -e modify,create,delete,move /root; do
    rsync -avz /root /mnt/disks/downloadDisk/backup/root
done

