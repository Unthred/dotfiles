#!/bin/bash

SESSION="main"

# Create session if it doesn't exist
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION

    # Window 1: system
    tmux rename-window -t $SESSION:1 system
    tmux send-keys -t $SESSION:1 "htop" C-m
    tmux split-window -h -t $SESSION:1
    tmux send-keys -t $SESSION:1.2 "docker ps" C-m

    # Window 2: storage
    tmux new-window -t $SESSION:2 -n storage
    tmux send-keys -t $SESSION:2 "watch -n 5 df -h" C-m

    # Window 3: docker logs
    tmux new-window -t $SESSION:3 -n logs
    tmux send-keys -t $SESSION:3 "docker stats" C-m

    # Window 4: shell
    tmux new-window -t $SESSION:4 -n shell
fi

tmux attach -t $SESSION
